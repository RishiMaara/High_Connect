/**
 * Firebase Functions – HIGH Connect
 * Node 20 / firebase-functions v5
 */

const admin = require("firebase-admin");
const nodemailer = require("nodemailer");
const { user } = require("firebase-functions/v1/auth");
const { onRequest } = require("firebase-functions/v2/https");

admin.initializeApp();

/* ================================
   EMAIL CONFIGURATION
   Using environment variable for Gmail App Password.
   Set via: firebase functions:secrets:set GMAIL_APP_PASSWORD
   Or set via: firebase functions:config:set gmail.pass="your_app_password"
   For now, falls back to direct config.
================================ */

function createTransporter() {
  const gmailUser = process.env.GMAIL_USER || "mr.stacksmith@gmail.com";
  const gmailPass = process.env.GMAIL_APP_PASSWORD;

  if (!gmailPass) {
    // Fallback: use nodemailer test account or log warning
    console.warn("⚠️  GMAIL_APP_PASSWORD not set. Using Ethereal test transport.");
    // Return a test transporter that logs emails (won't actually send)
    return nodemailer.createTransport({
      host: "smtp.ethereal.email",
      port: 587,
      secure: false,
      auth: {
        user: "ethereal_test@ethereal.email",
        pass: "ethereal_pass",
      },
    });
  }

  return nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: gmailUser,
      pass: gmailPass,
    },
  });
}

/* ================================
   AUTH TRIGGER
================================ */

exports.onUserDeleted = user().onDelete(async (userRecord) => {
  const firestore = admin.firestore();
  await firestore.doc(`users/${userRecord.uid}`).delete().catch(() => { });
});

/* ================================
   EMAIL OTP – SEND
================================ */

exports.sendEmailOtp = onRequest(
  { region: "us-central1", cors: true, invoker: "public" },
  async (req, res) => {
    if (req.method !== "POST") {
      return res.status(405).json({ error: "Method Not Allowed" });
    }

    const { email } = req.body;
    if (!email || !email.includes("@")) {
      return res.status(400).json({ error: "Invalid email" });
    }

    const otp = Math.floor(100000 + Math.random() * 900000).toString();
    const expiresAt = admin.firestore.Timestamp.fromDate(
      new Date(Date.now() + 10 * 60 * 1000)
    );

    const key = email
      .toLowerCase()
      .replace(/\./g, "_dot_")
      .replace(/@/g, "_at_");

    // Store OTP in Firestore
    await admin.firestore().collection("email_otps").doc(key).set({
      email,
      code: otp,
      attempts: 0,
      expiresAt,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    // Send email with OTP
    try {
      const transporter = createTransporter();
      await transporter.sendMail({
        from: '"HIGH Connect" <mr.stacksmith@gmail.com>',
        to: email,
        subject: "Your HIGH Connect Verification Code",
        html: `
          <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
            <h2 style="color: #2563eb; text-align: center;">HIGH Connect</h2>
            <p style="font-size: 16px;">Your verification code is:</p>
            <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 25px; border-radius: 12px; text-align: center; margin: 25px 0;">
              <span style="font-size: 36px; font-weight: bold; letter-spacing: 10px; color: white;">${otp}</span>
            </div>
            <p style="color: #6b7280;">This code will expire in <strong>10 minutes</strong>.</p>
            <p style="color: #9ca3af; font-size: 13px; margin-top: 30px;">If you didn't request this code, please ignore this email.</p>
          </div>
        `,
        text: `Your HIGH Connect verification code is: ${otp}. This code expires in 10 minutes.`,
      });
      console.log("✅ Email OTP sent to:", email);
      return res.json({ success: true });
    } catch (emailError) {
      console.error("❌ Email send failed:", emailError.message);
      // Still return the OTP in logs for debugging (remove in production)
      console.log("📋 OTP for", email, ":", otp);
      return res.status(500).json({ success: false, error: "Failed to send email. Please check your internet connection and try again." });
    }
  }
);

/* ================================
   EMAIL OTP – VERIFY
================================ */

exports.verifyEmailOtp = onRequest(
  { region: "us-central1", cors: true, invoker: "public" },
  async (req, res) => {
    if (req.method !== "POST") {
      return res.status(405).json({ error: "Method Not Allowed" });
    }

    const { email, code } = req.body;
    if (!email || !code) {
      return res.status(400).json({ error: "Missing data" });
    }

    const key = email
      .toLowerCase()
      .replace(/\./g, "_dot_")
      .replace(/@/g, "_at_");

    const ref = admin.firestore().collection("email_otps").doc(key);
    const snap = await ref.get();

    if (!snap.exists) {
      return res.status(400).json({ error: "OTP not found. Please request a new code." });
    }

    const data = snap.data();

    if (data.expiresAt.toDate() < new Date()) {
      await ref.delete();
      return res.status(400).json({ error: "Code expired. Please request a new one." });
    }

    if (data.code !== code) {
      const newAttempts = (data.attempts || 0) + 1;
      if (newAttempts >= 5) {
        await ref.delete();
        return res.status(400).json({ error: "Too many attempts. Please request a new code." });
      }
      await ref.update({ attempts: newAttempts });
      return res.status(400).json({ error: "Invalid code. Please try again." });
    }

    await ref.delete();
    return res.json({ success: true, verified: true });
  }
);
