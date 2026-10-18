import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  static String routeName = 'PrivacyPolicy';
  static String routePath = '/privacyPolicy';

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 22.0,
              borderWidth: 1.0,
              buttonSize: 44.0,
              icon: Icon(
                FFIcons.karrowLeft,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async => context.safePop(),
            ),
          ),
          title: Text(
            'Privacy Policy',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Each section gets a staggered fade+slide up animation
              _animated(0, _intro(context)),
              const SizedBox(height: 20),

              _animated(1, _sectionTitle(context, '1. What We Collect')),
              _animated(2, _body(context,
                  '• Account information: name, email, phone number, password, profile photo, location (city/area).\n\n'
                  '• Engineer profile data: professional credentials, licence numbers, portfolio images, service categories, fees, work history, ratings and reviews.\n\n'
                  '• Payment and billing data: payment method token, billing name and address. We do not store full card numbers.\n\n'
                  '• Usage data: app activity, search queries, saved services, bookings, messages, timestamps, device type, app version, IP address, crash logs.\n\n'
                  '• Communications: support requests, feedback, and other messages you send us.\n\n'
                  '• Optional data: documents you upload (e.g., identity verification, certifications) and any public info you add to your profile.')),

              _animated(3, _sectionTitle(context, '2. How We Use Your Information')),
              _animated(4, _body(context,
                  '• To create and manage your account and profile.\n\n'
                  '• To connect clients with engineers, show relevant profiles, process bookings and payments, and facilitate messaging.\n\n'
                  '• To verify identities, credentials, and perform eligibility checks for engineers.\n\n'
                  '• To provide customer support and respond to enquiries.\n\n'
                  '• To improve and personalise the app experience, recommend engineers, and analyse usage for product improvements.\n\n'
                  '• To send transactional notifications (booking confirmations, receipts) and marketing communications if you opt in.\n\n'
                  '• To detect and prevent fraud, abuse, or illegal activity, and to enforce our Terms and policies.')),

              _animated(5, _sectionTitle(context, '3. How We Share Your Information')),
              _animated(6, _body(context,
                  '• With other users: when you post a public profile, rating, or message, relevant details become visible to other users as described in the app.\n\n'
                  '• Service providers: third-party processors (payment processors, hosting, analytics, messaging, identity verification) who act under our instructions.\n\n'
                  '• Legal and safety: to comply with legal obligations, respond to lawful requests, protect rights, property, or safety, or investigate fraud.\n\n'
                  '• Business transfers: in the event of a merger, acquisition, or sale of assets, user data may be transferred with notice to affected users.\n\n'
                  '• We do not sell your personal information for advertising purposes.')),

              _animated(7, _sectionTitle(context, '4. Data Security')),
              _animated(8, _body(context,
                  'We implement industry-standard security measures to protect your information, including encryption, secure servers, and access controls. However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security.')),

              _animated(9, _sectionTitle(context, '5. Your Rights and Choices')),
              _animated(10, _body(context,
                  '• Access and Update: you can review and update your account information in the app.\n\n'
                  '• Delete Data: you may request deletion of your account and personal data by contacting us.\n\n'
                  '• Opt-Out: you can opt out of promotional emails or notifications through the app settings.\n\n'
                  '• Location Services: you can disable location sharing in your device settings, though this may limit app functionality.')),

              _animated(11, _sectionTitle(context, '6. Data Retention')),
              _animated(12, _body(context,
                  'We retain personal data as long as necessary to provide services, comply with legal obligations, resolve disputes, and enforce policies. Retention periods depend on the data category and legal requirements.')),

              _animated(13, _sectionTitle(context, '7. Children')),
              _animated(14, _body(context,
                  'Our services are not directed to children under 16. We do not knowingly collect personal information from children under this age. If we learn we have collected such data, we will delete it promptly.')),

              _animated(15, _sectionTitle(context, '8. Third-Party Links and Integrations')),
              _animated(16, _body(context,
                  'Our app may contain links or integrations with third-party services (payment gateways, maps, analytics). These third parties have their own privacy practices. We recommend reviewing their privacy policies before use.')),

              _animated(17, _sectionTitle(context, '9. International Transfers')),
              _animated(18, _body(context,
                  'Your data may be processed or stored in countries outside your residence. We will take appropriate legal measures (standard contractual clauses or other safeguards) to ensure adequate protection when transferring data internationally.')),

              _animated(19, _sectionTitle(context, '10. Engineers and Payments')),
              _animated(20, _body(context,
                  '• Engineers pay a one-time profile listing fee; billing details are processed via third-party payment processors and used only to manage subscriptions and transactions.\n\n'
                  '• Professional credentials and documents you upload may be verified and stored as necessary to ensure service quality and compliance.')),

              _animated(21, _sectionTitle(context, '11. Contact Us')),
              _animated(22, _body(context,
                  'If you have any questions about this Privacy Policy, please contact us:\n\nEmail: support.highconnect@gmail.com')),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // ── Animation wrapper ────────────────────────────────────────────────────────
  /// Wraps a widget in a staggered fade + slide-up animation.
  Widget _animated(int index, Widget child) {
    final delay = (index * 60).clamp(0, 800);
    return child
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: delay),
          duration: 400.ms,
          curve: Curves.easeOut,
        )
        .slideY(
          begin: 0.12,
          end: 0,
          delay: Duration(milliseconds: delay),
          duration: 400.ms,
          curve: Curves.easeOut,
        );
  }

  // ── Helper widgets ───────────────────────────────────────────────────────────

  Widget _intro(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        'Thank you for choosing HIGH Connect \u2014 we\'re honoured to connect you with trusted civil engineers. '
        'By using HIGH Connect, you agree to the terms of this Privacy Policy. '
        'If you do not accept these terms, please refrain from using the app.',
        style: GoogleFonts.inter(
          fontSize: 14,
          height: 1.6,
          color: FlutterFlowTheme.of(context).primaryText,
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        title,
        style: FlutterFlowTheme.of(context).titleMedium.override(
              font: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
              ),
              fontSize: 16,
              letterSpacing: 0,
            ),
      ),
    );
  }

  Widget _body(BuildContext context, String text) {
    return Text(
      text,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            ),
            letterSpacing: 0,
            lineHeight: 1.65,
          ),
    );
  }
}
