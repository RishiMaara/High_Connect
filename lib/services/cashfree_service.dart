// lib/services/cashfree_service.dart
// HIGH Connect Implementation

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
// ignore: deprecated_member_use
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:http/http.dart' as http;
import 'cashfree_config.dart';

class CashfreeService {
  // ── Singleton ───────────────────────────────────────────────────────────────
  CashfreeService._();
  static final CashfreeService instance = CashfreeService._();

  // ── Cloud Function URL ──────────────────────────────────────────────────────
  // HIGH Connect Firebase Project: high-connect-3
  static const String _createOrderFunctionUrl =
      'https://us-central1-high-connect-3.cloudfunctions.net/createCashfreeOrderV2';

  // ── Create Order (via Firebase Cloud Function) ──────────────────────────────
  /// Creates a Cashfree order via our secure backend Cloud Function.
  /// Returns {orderId, paymentSessionId} or null on failure.
  Future<Map<String, String>?> createOrder({
    required String customerId,
    required String customerName,
    required String customerEmail,
    required String customerPhone,
    String serviceCategory = '',
  }) async {
    final uri = Uri.parse(_createOrderFunctionUrl);

    final body = jsonEncode({
      'amount': kRegistrationFee,
      'customer_id': customerId.isNotEmpty ? customerId : 'user_anon',
      'customer_name': customerName.isNotEmpty ? customerName : 'Provider',
      'customer_email':
          customerEmail.isNotEmpty ? customerEmail : 'support@highconnect.in',
      'customer_phone':
          customerPhone.isNotEmpty ? customerPhone : '9999999999',
      'is_prod': kCashfreeUseProd,
      'service_category': serviceCategory,
    });

    debugPrint('[CashfreeService] Creating order via Cloud Function...');
    debugPrint('[CashfreeService] is_prod=$kCashfreeUseProd');

    try {
      final response = await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: body,
          )
          .timeout(const Duration(seconds: 30));

      debugPrint('[CashfreeService] Response status: ${response.statusCode}');
      debugPrint('[CashfreeService] Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (data['success'] == true) {
          return {
            'orderId': data['order_id'] as String,
            'paymentSessionId': data['payment_session_id'] as String,
          };
        } else {
          debugPrint('[CashfreeService] Function returned error: ${data['error']}');
        }
      } else {
        debugPrint(
            '[CashfreeService] HTTP error ${response.statusCode}: ${response.body}');
      }

      return null;
    } on http.ClientException catch (e) {
      debugPrint('[CashfreeService] Network error: $e');
      return null;
    } catch (e, st) {
      debugPrint('[CashfreeService] Exception: $e\n$st');
      return null;
    }
  }

  // ── Build CFSession ─────────────────────────────────────────────────────────
  /// Builds a CFSession from the order data returned by createOrder.
  CFSession? buildSession({
    required String orderId,
    required String paymentSessionId,
  }) {
    try {
      final env =
          kCashfreeUseProd ? CFEnvironment.PRODUCTION : CFEnvironment.SANDBOX;
      return CFSessionBuilder()
          .setEnvironment(env)
          .setOrderId(orderId)
          .setPaymentSessionId(paymentSessionId)
          .build();
    } on CFException catch (e) {
      debugPrint('[CashfreeService] CFSession build error: ${e.message}');
      return null;
    }
  }

  // ── Launch Web Checkout ─────────────────────────────────────────────────────
  /// Initiates the Cashfree web checkout payment flow.
  void doWebCheckout({
    required CFPaymentGatewayService gatewayService,
    required String orderId,
    required String paymentSessionId,
  }) {
    try {
      final session = buildSession(
        orderId: orderId,
        paymentSessionId: paymentSessionId,
      );
      if (session == null) {
        debugPrint('[CashfreeService] Session build failed — aborting checkout.');
        return;
      }

      debugPrint('[CashfreeService] Using Flutter SDK');
      if (kIsWeb) {
        // Use DropCheckout on Web to prevent full page redirect and state loss.
        // ignore: deprecated_member_use
        final cfDropCheckout = CFDropCheckoutPaymentBuilder().setSession(session).build();
        gatewayService.doPayment(cfDropCheckout);
      } else {
        final cfWebCheckout =
            CFWebCheckoutPaymentBuilder().setSession(session).build();
        gatewayService.doPayment(cfWebCheckout);
      }
    } on CFException catch (e) {
      debugPrint('[CashfreeService] doPayment error: ${e.message}');
    }
  }
}
