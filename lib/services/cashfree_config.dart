// lib/services/cashfree_config.dart
// ignore_for_file: constant_identifier_names

/// Toggle: false = Sandbox / TEST, true = Production
const bool kCashfreeUseProd = true; 

/// Registration fee charged to providers (in INR)
const double kRegistrationFee = 1.0;
const String kRegistrationFeeStr = '1.00';

// ── Test (Sandbox) credentials ────────────────────────────────────────────────
const String kCashfreeTestAppId = 'YOUR_CASHFREE_TEST_APP_ID';
const String kCashfreeTestSecretKey = 'YOUR_CASHFREE_TEST_SECRET_KEY';

// ── Production credentials ────────────────────────────────────────────────────
const String kCashfreeProdAppId = 'YOUR_CASHFREE_PROD_APP_ID';
const String kCashfreeProdSecretKey = 'YOUR_CASHFREE_PROD_SECRET_KEY';

// ── Active credentials (auto-selects based on flag) ───────────────────────────
String get cashfreeAppId =>
    kCashfreeUseProd ? kCashfreeProdAppId : kCashfreeTestAppId;

String get cashfreeSecretKey =>
    kCashfreeUseProd ? kCashfreeProdSecretKey : kCashfreeTestSecretKey;

// ── API base URLs ─────────────────────────────────────────────────────────────
String get cashfreeBaseUrl => kCashfreeUseProd
    ? 'https://api.cashfree.com'
    : 'https://sandbox.cashfree.com';

/// Cashfree API version header value
const String kCashfreeApiVersion = '2023-08-01';
