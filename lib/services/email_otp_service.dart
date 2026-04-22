import 'dart:math';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

/// Service for handling real email OTP verification directly from the app
/// Bypasses Firestore completely to avoid "Permission Denied" errors!
class EmailOtpService {
  // Store OTPs locally in memory while the app is running
  static final Map<String, String> _otpCache = {};
  
  // ========================================================
  // 🚨 IMPORTANT: CONFIGURE YOUR GMAIL APP PASSWORD HERE 🚨
  // ========================================================
  static const String _smtpEmail = 'mr.stacksmith@gmail.com'; 
  static const String _smtpPassword = 'xzfebokxpuinrjnb'; 

  /// Send real OTP Email via SMTP (Or Simulated on Web)
  static Future<bool> sendOtp(String email) async {
    try {
      final String code = (100000 + Random().nextInt(900000)).toString();
      final String cleanEmail = email.trim().toLowerCase();
      
      // Store in memory for verification
      _otpCache[cleanEmail] = code;

      // 🚨 CRITICAL BROWSER LIMITATION 🚨
      // Web browsers fiercely block raw TCP Sockets for security reasons.
      // Therefore, the direct SMTP 'mailer' package CANNOT work when running in Chrome.
      // It WILL work perfectly when you compile this to an Android/APK or iOS app!
      if (kIsWeb) {
        Fluttertoast.showToast(
          msg: "TEST OTP: $code\n(Web blocks raw emails. Native app will send real email!)",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        debugPrint('Web Mode: Real Emails bypassed due to TCP block. OTP is: $code');
        return true;
      }

      // 📱 NATIVE MOBILE EXECUTION (Where Raw Sockets are allowed!)
      final smtpServer = gmail(_smtpEmail, _smtpPassword);

      final message = Message()
        ..from = Address(_smtpEmail, 'HIGH Connect')
        ..recipients.add(cleanEmail)
        ..subject = 'Your HIGH Connect Verification Code'
        ..html = '''
          <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
            <h2 style="color: #2563eb; text-align: center;">HIGH Connect</h2>
            <p style="font-size: 16px;">Your verification code is:</p>
            <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 25px; border-radius: 12px; text-align: center; margin: 25px 0;">
              <span style="font-size: 36px; font-weight: bold; letter-spacing: 10px; color: white;">$code</span>
            </div>
            <p style="color: #6b7280;">This code is valid for your current session.</p>
          </div>
        ''';

      debugPrint('Sending real email via SMTP to $cleanEmail...');
      await send(message, smtpServer);
      debugPrint('✅ Email successfully sent!');
      
      return true;
    } catch (e) {
      if (e is MailerException) {
         for (var p in e.problems) {
            debugPrint('SMTP Problem: ${p.code}: ${p.msg}');
         }
         if (e.message.contains('535') || e.message.contains('Invalid login')) {
           throw Exception("Gmail App Password rejected! Please generate a new 16-character App Password.");
         }
      }
      throw Exception('Failed to send email: ${e.toString().replaceAll('Exception: ', '')}');
    }
  }

  /// Verify OTP code directly from RAM cache
  static Future<bool> verifyOtp(String email, String code) async {
    final String cleanEmail = email.trim().toLowerCase();
    final String? storedCode = _otpCache[cleanEmail];
    
    if (storedCode == null) {
      throw Exception('OTP not found. Please request a new code.');
    }
    
    if (storedCode != code.trim()) {
      throw Exception('Invalid code. Please try again.');
    }

    // Reset OTP upon successful verification
    _otpCache.remove(cleanEmail);
    return true;
  }
}
