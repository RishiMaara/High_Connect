import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Email OTP via Firebase Functions (Gen 1 HTTP): `sendEmailOtpV2` / `verifyEmailOtpV2`.
/// Matches [firebase/functions/index.js] and avoids embedding SMTP credentials in the app.
class EmailOtpService {
  EmailOtpService._();

  static const String _functionsBaseUrl =
      'https://us-central1-high-connect-3.cloudfunctions.net';

  static Future<bool> sendOtp(String email) async {
    final trimmed = email.trim();
    if (trimmed.isEmpty || !trimmed.contains('@')) {
      throw Exception('Invalid email address.');
    }

    final uri = Uri.parse('$_functionsBaseUrl/sendEmailOtpV2');
    try {
      final resp = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': trimmed}),
      );

      Map<String, dynamic>? json;
      if (resp.body.isNotEmpty) {
        try {
          json = jsonDecode(resp.body) as Map<String, dynamic>?;
        } catch (_) {}
      }

      final ok = resp.statusCode >= 200 &&
          resp.statusCode < 300 &&
          json?['success'] == true;
      if (ok) return true;

      final err = json?['error']?.toString().trim();
      if (err != null && err.isNotEmpty) throw Exception(err);
      throw Exception(
        'Could not send verification email (${resp.statusCode}).',
      );
    } catch (e, st) {
      debugPrint('[EmailOtp] sendOtp failed: $e\n$st');
      if (e is Exception) rethrow;
      throw Exception(e.toString());
    }
  }

  static Future<bool> verifyOtp(String email, String code) async {
    final uri = Uri.parse('$_functionsBaseUrl/verifyEmailOtpV2');
    try {
      final resp = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email.trim(),
          'code': code.trim(),
        }),
      );

      Map<String, dynamic>? json;
      if (resp.body.isNotEmpty) {
        try {
          json = jsonDecode(resp.body) as Map<String, dynamic>?;
        } catch (_) {}
      }

      final ok = resp.statusCode >= 200 &&
          resp.statusCode < 300 &&
          (json?['success'] == true || json?['verified'] == true);
      if (ok) return true;

      final err = json?['error']?.toString().trim();
      if (err != null && err.isNotEmpty) throw Exception(err);
      throw Exception(
        'Verification failed (${resp.statusCode}).',
      );
    } catch (e, st) {
      debugPrint('[EmailOtp] verifyOtp failed: $e\n$st');
      if (e is Exception) rethrow;
      throw Exception(e.toString());
    }
  }
}
