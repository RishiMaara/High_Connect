import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
            alignment: AlignmentDirectional(0.0, 0.0),
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
              onPressed: () async {
                context.safePop();
              },
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
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Thank you for choosing HIGH Connect — we’re honored to be part of your project and to connect you with trusted civil engineers. Your trust helps us build a stronger community of skilled professionals and satisfied homeowners. We’ll work quickly to match you with the right engineer and support you at every step. If you need any help, our team is here to assist and ensure a smooth experience. Thank you for building with High Connect.\n\nBy using HIGH Connect, you agree to the terms of this Privacy Policy. Please understand that by not accepting the terms you should refrain from using the app.\n\n1. What we collect\n Account information: name, email, phone number, password, profile photo, location (city/area).\n\n  Engineer profile data: professional credentials, license numbers, portfolio images, service categories, fees, work history, ratings and reviews.\n\n Payment and billing data: payment method token, billing name and address; we do not store full card numbers unless you explicitly authorize a payment processor to do so.\n\n Usage data: app activity, search queries, saved services, bookings, messages, timestamps, device type, app version, IP address, crash logs.\n\n Communications: support requests, feedback, and other messages you send us.\n\n Optional data: documents you upload (e.g., identity verification, certifications) and any public info you add to your profile.\n\n2. How we use your information\n To create and manage your account and profile.\n\n To connect clients with engineers, show relevant profiles, process bookings and payments, and facilitate messaging between users and engineers.\n\n To verify identities, credentials, and to perform eligibility checks for engineers.\n\n To provide customer support and respond to inquiries\n\nTo improve and personalize the app experience, recommend engineers, and analyze usage for product improvements.\n\nTo send transactional notifications (booking confirmations, receipts) and marketing communications if you opt in.\n\n To detect and prevent fraud, abuse, or illegal activity, and to enforce our Terms and policies.\n\n3. How We Share Your Information\n \nWith other users: When you post a public  profile, rating, or message, relevant details become visible to other users as described in the app.\n\n Service providers: Third-party processors (payment processors, hosting, analytics, messaging, identity verification) who act under our instructions and are bound to protect your data.\n\n Legal and safety: To comply with legal obligations, respond to lawful requests, protect rights, property, safety, or investigate fraud or threats.\n\n Business transfers: In the event of a merger, acquisition, or sale of assets, user data may be transferred as part of the transaction with notice to affected users.\n\n We do not sell your personal information for advertising purposes.\n\n\n For Legal Reasons: If required by law or to protect our rights, we may disclose information to authorities or in response to legal requests.\n\n With Your Consent: We may share information with third parties if you explicitly consent.\n\n4. Data Security\n\n We implement industry-standard security measures to protect your information, including encryption, secure servers, and access controls. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.\n\n5. Your Rights and Choices\n\n You have the following rights regarding your data:\n\n Access and Update: You can review and update your account information in the app.\n\n Delete Data: You may request deletion of your account and personal data by contacting us.\n\n Opt-Out: You can opt out of promotional emails or notifications through the app settings.\n\n Location Services: You can disable location sharing in your device settings, but this may limit app functionality.\n\n6. Data Retention\n\n Retention: We retain personal data as long as necessary to provide services, comply with legal obligations, resolve disputes, and enforce policies. Retention periods depend on the data category and legal requirements.\n\n Security: We implement administrative, technical, and physical safeguards (encryption in transit, access controls, secure data storage) to protect data. No system is fully secure; in the event of a data breach we will follow applicable legal notification obligations.\n\n7. Children\n\n Our services are not directed to children under 16 (or age required by local law). We do not knowingly collect personal information from children under this age. If we learn that we have collected such data, we will delete it promptly.\n\n8. Third‑party links and integrations\n\n Our app may contain links or integrations with third-party services (payment gateways, maps, analytics). These third parties have their own privacy practices; we are not responsible for their actions. We recommend reviewing their privacy policies before use.\n\n9. International transfers\n\n Your data may be processed or stored in countries outside your residence. We will take appropriate legal measures (standard contractual clauses, other safeguards) to ensure adequate protection when transferring data internationally.\n\n\n\n11. Additional notes for engineers and payments\n\n  Engineers pay a basic profile listing fee; billing details are processed via third-party payment processors and used only to manage subscriptions and transactions.\n  Professional credentials and any documents you upload may be verified and stored as necessary to ensure service quality and compliance.\n\n\n11. Contact Us\nIf you have any questions about this Privacy Policy, please contact us at:\nEmail: support.highconnect@gmail.com',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
