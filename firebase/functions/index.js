/**
 * Firebase Functions – HIGH Connect
 * Node 20 / firebase-functions v4
 */

const admin = require("firebase-admin");
const nodemailer = require("nodemailer");
const functions = require("firebase-functions");

admin.initializeApp();

// ─── Helpers ──────────────────────────────────────────────────────────────────

function str(v) {
  if (v === undefined || v === null) return "";
  return String(v);
}

function createTransporter() {
  const gmailUser = process.env.GMAIL_USER || process.env.EMAIL_USER || "mr.stacksmith@gmail.com";
  const gmailPass = process.env.GMAIL_APP_PASSWORD || process.env.EMAIL_PASS;
  if (!gmailPass) {
    console.warn("⚠️  GMAIL_APP_PASSWORD or EMAIL_PASS not set.");
    return null;
  }
  return nodemailer.createTransport({
    service: "gmail",
    auth: { user: gmailUser, pass: gmailPass },
  });
}

// ─── AUTH TRIGGERS ────────────────────────────────────────────────────────────

exports.onUserCreated = functions.auth.user().onCreate(async (userRecord) => {
  const db = admin.firestore();
  const uid = userRecord.uid;
  const email = userRecord.email || "";
  const phoneNumber = userRecord.phoneNumber || "";

  for (let attempt = 0; attempt <= 2; attempt++) {
    try {
      const userDoc = await db.doc(`users/${uid}`).get();
      if (userDoc.exists) {
        console.log(`ℹ️  User doc already exists for ${uid}`);
        return;
      }
      await db.doc(`users/${uid}`).set({
        email,
        phone_number: phoneNumber,
        display_name: email ? email.split("@")[0] : "User",
        created_time: admin.firestore.FieldValue.serverTimestamp(),
        email_sign_up: !!email,
        in_service: false,
      });
      console.log(`✅ User doc created for ${uid}`);
      return;
    } catch (err) {
      const transient = ["unavailable", "deadline-exceeded", "resource-exhausted"].includes(err.code);
      if (transient && attempt < 2) {
        await new Promise(r => setTimeout(r, 1000));
      } else {
        console.error(`❌ onUserCreated failed for ${uid}:`, err.message);
        return;
      }
    }
  }
});

exports.onUserDeleted = functions.auth.user().onDelete(async (userRecord) => {
  await admin.firestore().doc(`users/${userRecord.uid}`).delete().catch(() => {});
});

// ─── EMAIL OTP ────────────────────────────────────────────────────────────────

exports.sendEmailOtpV2 = functions.https.onRequest(async (req, res) => {
  res.set("Access-Control-Allow-Origin", "*");
  res.set("Access-Control-Allow-Methods", "POST, OPTIONS");
  res.set("Access-Control-Allow-Headers", "Content-Type");
  if (req.method === "OPTIONS") return res.status(204).send("");
  if (req.method !== "POST") return res.status(405).json({ error: "Method Not Allowed" });

  const { email } = req.body;
  if (!email || !email.includes("@")) return res.status(400).json({ error: "Invalid email" });

  const otp = Math.floor(100000 + Math.random() * 900000).toString();
  const expiresAt = admin.firestore.Timestamp.fromDate(new Date(Date.now() + 10 * 60 * 1000));
  const key = email.toLowerCase().replace(/\./g, "_dot_").replace(/@/g, "_at_");

  await admin.firestore().collection("email_otps").doc(key).set({
    email, code: otp, attempts: 0, expiresAt,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  const transporter = createTransporter();
  if (!transporter) {
    console.log(`📋 OTP for ${email}: ${otp}`);
    return res.status(500).json({ success: false, error: "Email service not configured." });
  }

  try {
    await transporter.sendMail({
      from: '"HIGH Connect" <mr.stacksmith@gmail.com>',
      to: email,
      subject: "Your HIGH Connect Verification Code",
      html: `<div style="font-family:Arial,sans-serif;max-width:600px;margin:0 auto;padding:20px">
        <h2 style="color:#2563eb;text-align:center">HIGH Connect</h2>
        <p>Your verification code is:</p>
        <div style="background:linear-gradient(135deg,#667eea,#764ba2);padding:25px;border-radius:12px;text-align:center;margin:25px 0">
          <span style="font-size:36px;font-weight:bold;letter-spacing:10px;color:white">${otp}</span>
        </div>
        <p style="color:#6b7280">This code expires in <strong>10 minutes</strong>.</p>
      </div>`,
      text: `Your HIGH Connect verification code is: ${otp}. Expires in 10 minutes.`,
    });
    console.log("✅ Email OTP sent to:", email);
    return res.json({ success: true });
  } catch (e) {
    console.error("❌ Email send failed:", e.message);
    return res.status(500).json({ success: false, error: "Failed to send email." });
  }
});

exports.verifyEmailOtpV2 = functions.https.onRequest(async (req, res) => {
  res.set("Access-Control-Allow-Origin", "*");
  res.set("Access-Control-Allow-Methods", "POST, OPTIONS");
  res.set("Access-Control-Allow-Headers", "Content-Type");
  if (req.method === "OPTIONS") return res.status(204).send("");
  if (req.method !== "POST") return res.status(405).json({ error: "Method Not Allowed" });

  const { email, code } = req.body;
  if (!email || !code) return res.status(400).json({ error: "Missing data" });

  const key = email.toLowerCase().replace(/\./g, "_dot_").replace(/@/g, "_at_");
  const ref = admin.firestore().collection("email_otps").doc(key);
  const snap = await ref.get();

  if (!snap.exists) return res.status(400).json({ error: "OTP not found. Please request a new code." });

  const data = snap.data();
  if (data.expiresAt.toDate() < new Date()) {
    await ref.delete();
    return res.status(400).json({ error: "Code expired. Please request a new one." });
  }
  if (data.code !== code) {
    const attempts = (data.attempts || 0) + 1;
    if (attempts >= 5) { await ref.delete(); return res.status(400).json({ error: "Too many attempts." }); }
    await ref.update({ attempts });
    return res.status(400).json({ error: "Invalid code. Please try again." });
  }

  await ref.delete();
  return res.json({ success: true, verified: true });
});

// ─── CASHFREE – CREATE ORDER ──────────────────────────────────────────────────

exports.createCashfreeOrderV2 = functions.https.onRequest(async (req, res) => {
  res.set("Access-Control-Allow-Origin", "*");
  res.set("Access-Control-Allow-Methods", "POST, OPTIONS");
  res.set("Access-Control-Allow-Headers", "Content-Type");
  if (req.method === "OPTIONS") return res.status(204).send("");
  if (req.method !== "POST") return res.status(405).json({ error: "Method Not Allowed" });

  const { amount, customer_id, customer_name, customer_email, customer_phone, is_prod } = req.body;
  if (!amount || !customer_id) return res.status(400).json({ error: "Missing required fields" });

  const appId = process.env.CASHFREE_APP_ID || (is_prod ? "YOUR_CASHFREE_PROD_APP_ID" : "YOUR_CASHFREE_TEST_APP_ID");
  const secretKey = process.env.CASHFREE_SECRET_KEY || (is_prod ? "YOUR_CASHFREE_PROD_SECRET_KEY" : "YOUR_CASHFREE_TEST_SECRET_KEY");
  const baseUrl = is_prod ? "https://api.cashfree.com" : "https://sandbox.cashfree.com";

  const orderId = `HC_${customer_id.substring(0, 8)}_${Date.now()}`;
  const serviceCategory = req.body.service_category || "";
  const returnUrl = `https://high-connect-3.web.app/paymentCallback?order_id={order_id}&order_status={order_status}&serviceCategory=${encodeURIComponent(serviceCategory)}`;

  const rawPhone = (customer_phone || "").replace(/\D/g, "");
  const digits = rawPhone.startsWith("91") && rawPhone.length === 12 ? rawPhone.slice(2) : rawPhone;
  const validPhone = /^[6-9]\d{9}$/.test(digits) ? digits : "9000000001";

  try {
    const fetch = (await import("node-fetch")).default;
    const response = await fetch(`${baseUrl}/pg/orders`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-client-id": appId,
        "x-client-secret": secretKey,
        "x-api-version": "2023-08-01",
      },
      body: JSON.stringify({
        order_amount: parseFloat(amount).toFixed(2),
        order_currency: "INR",
        order_id: orderId,
        customer_details: {
          customer_id,
          customer_name: customer_name || "Customer",
          customer_email: customer_email || "support@highconnect.in",
          customer_phone: validPhone,
        },
        order_meta: {
          return_url: returnUrl,
          payment_methods: "cc,dc,nb,upi,paylater,emi",
        },
      }),
    });

    const data = await response.json();
    if (response.ok) {
      return res.json({ success: true, order_id: data.order_id, payment_session_id: data.payment_session_id });
    }
    console.error("Cashfree API Error:", data);
    return res.status(response.status).json({ success: false, error: data.message });
  } catch (err) {
    console.error("Cashfree Internal Error:", err);
    return res.status(500).json({ success: false, error: "Internal Server Error" });
  }
});

// ─── FCM – PUSH ON NOTIFICATION DOC CREATED ──────────────────────────────────

exports.sendPushOnUserNotification = functions.firestore
  .document("users/{userId}/notifications/{notificationId}")
  .onCreate(async (snap, context) => {
    const userId = context.params.userId;
    const notificationId = context.params.notificationId;
    const data = snap.data() || {};

    if (data.skip_fcm_push === true || data.fcm_delivered === true) return;

    const userRef = admin.firestore().doc(`users/${userId}`);
    const userSnap = await userRef.get();

    if (!userSnap.exists) {
      console.warn("[FCM] user doc missing:", userId);
      await snap.ref.update({ fcm_status: "no_user_doc", fcm_updated_at: admin.firestore.FieldValue.serverTimestamp() }).catch(() => {});
      return;
    }

    const fcmToken = userSnap.get("fcmToken");
    if (!fcmToken || typeof fcmToken !== "string" || fcmToken.length < 20) {
      console.warn("[FCM] no valid fcmToken for user", userId);
      await snap.ref.update({ fcm_status: "no_token", fcm_updated_at: admin.firestore.FieldValue.serverTimestamp() }).catch(() => {});
      return;
    }

    const title = str(data.title) || "HIGH Connect";
    const body = str(data.description) || "You have a new notification.";

    const message = {
      token: fcmToken,
      notification: { title, body },
      data: {
        type: str(data.type),
        notification_id: notificationId,
        title,
        body,
        customer_name: str(data.customer_name),
        service_title: str(data.service_title),
        booking_number: str(data.booking_number),
        booking_ref: str(data.booking_ref),
        dedupe_key: str(data.dedupe_key) || notificationId,
      },
      android: {
        priority: "high",
        notification: {
          channelId: "high_connect_notifications",
          sound: "default",
          tag: notificationId,
        },
      },
      apns: {
        headers: { "apns-priority": "10" },
        payload: { aps: { sound: "default", badge: 1 } },
      },
    };

    try {
      const messageId = await admin.messaging().send(message);
      console.log("[FCM] sent ok user=", userId, "mid=", messageId);
      await snap.ref.update({
        fcm_delivered: true,
        fcm_message_id: messageId,
        fcm_status: "sent",
        fcm_sent_at: admin.firestore.FieldValue.serverTimestamp(),
      });
    } catch (err) {
      const code = err && err.code;
      console.error("[FCM] send failed user=", userId, code || err.message);

      if (code === "messaging/invalid-registration-token" ||
          code === "messaging/registration-token-not-registered") {
        await userRef.set(
          { fcmToken: admin.firestore.FieldValue.delete(), fcmTokenInvalidatedAt: admin.firestore.FieldValue.serverTimestamp() },
          { merge: true }
        ).catch(() => {});
      }

      await snap.ref.update({
        fcm_delivered: false,
        fcm_status: code === "messaging/invalid-registration-token" ? "invalid_token_cleared" : "error",
        fcm_error: str(err.message || err),
        fcm_updated_at: admin.firestore.FieldValue.serverTimestamp(),
      }).catch(() => {});
    }
  });

// ─── DELETE USER ACCOUNT ──────────────────────────────────────────────────────

async function _deleteUserData(uid) {
  const db = admin.firestore();
  const userRef = db.doc(`users/${uid}`);
  console.log(`🗑️  Deleting account for uid: ${uid}`);

  async function deleteQuery(query) {
    const snap = await query.get();
    if (snap.empty) return;
    for (let i = 0; i < snap.docs.length; i += 400) {
      const batch = db.batch();
      snap.docs.slice(i, i + 400).forEach(d => batch.delete(d.ref));
      await batch.commit();
    }
    console.log(`  ✅ deleted ${snap.size} docs`);
  }

  async function deleteSubcollection(parentRef, name) {
    return deleteQuery(parentRef.collection(name));
  }

  try {
    const userSnap = await userRef.get();
    const userData = userSnap.exists ? userSnap.data() : {};

    await deleteSubcollection(userRef, "addresses");
    await deleteSubcollection(userRef, "notifications");
    await deleteSubcollection(userRef, "feedback");
    await deleteSubcollection(userRef, "user_reviews");
    await deleteSubcollection(userRef, "payment_methods");
    await deleteSubcollection(userRef, "my_bookings");

    if (userData.service) {
      try {
        const sRef = userData.service;
        await deleteSubcollection(sRef, "service_review");
        await deleteSubcollection(sRef, "service_address");
        await deleteSubcollection(sRef, "service_payment");
        await sRef.delete();
      } catch (e) { console.warn("service delete failed:", e.message); }
    }

    if (userData.support) {
      try {
        await deleteSubcollection(userData.support, "support_messages");
        await userData.support.delete();
      } catch (e) { console.warn("support delete failed:", e.message); }
    }

    await deleteQuery(db.collection("my_bookings").where("user", "==", userRef));
    await deleteQuery(db.collection("my_bookings").where("provider", "==", userRef));
    await deleteQuery(db.collection("addresses").where("user", "==", userRef));
    await deleteQuery(db.collection("payment_methods").where("user", "==", userRef));
    await deleteQuery(db.collection("notifications").where("recipient", "==", userRef));
    await deleteQuery(db.collection("service_review").where("user", "==", userRef));
    await deleteQuery(db.collection("user_reviews").where("user", "==", userRef));
    await deleteQuery(db.collection("feedback").where("user", "==", userRef));
    await deleteQuery(db.collection("report").where("user", "==", userRef));
    await deleteQuery(db.collection("calls").where("caller", "==", userRef));
    await deleteQuery(db.collection("calls").where("callee", "==", userRef));
    await deleteQuery(db.collection("service_providers").where("user_ref", "==", userRef));
    await deleteQuery(db.collection("services").where("provider", "==", userRef));

    const chatsSnap = await db.collection("chats").where("users", "array-contains", userRef).get();
    for (const chatDoc of chatsSnap.docs) {
      await deleteSubcollection(chatDoc.ref, "chat_messages");
      await chatDoc.ref.delete();
    }

    if (userData.phone_number) {
      const phoneKey = userData.phone_number.replace(/\+/g, "_plus_").replace(/\s/g, "");
      await db.collection("sms_otps").doc(phoneKey).delete().catch(() => {});
    }
    if (userData.email) {
      const emailKey = userData.email.toLowerCase().replace(/\./g, "_dot_").replace(/@/g, "_at_");
      await db.collection("email_otps").doc(emailKey).delete().catch(() => {});
      await deleteQuery(db.collection("mail").where("to", "==", userData.email));
    }

    await userRef.delete();
    console.log(`  ✅ users/${uid} deleted`);

    await admin.auth().deleteUser(uid);
    console.log(`  ✅ Auth account deleted for uid: ${uid}`);

    return { success: true };
  } catch (err) {
    console.error(`❌ deleteUserData failed for ${uid}:`, err.message);
    throw new Error("Failed to delete account. Please try again.");
  }
}

exports.deleteUserAccountV2 = functions.https.onCall(async (data, context) => {
  if (!context.auth) throw new functions.https.HttpsError("unauthenticated", "Not authenticated");
  return await _deleteUserData(context.auth.uid);
});

exports.deleteUserAccountByTokenV2 = functions.https.onCall(async (data, context) => {
  const { idToken, uid } = data || {};
  if (!idToken || !uid) throw new functions.https.HttpsError("invalid-argument", "Missing idToken or uid");

  try {
    const decoded = await admin.auth().verifyIdToken(idToken);
    if (decoded.uid !== uid) throw new Error("Token UID mismatch");
  } catch (e) {
    console.error("Token verification failed:", e.message);
    throw new functions.https.HttpsError("permission-denied", "Unauthorized: invalid token");
  }

  return await _deleteUserData(uid);
});
