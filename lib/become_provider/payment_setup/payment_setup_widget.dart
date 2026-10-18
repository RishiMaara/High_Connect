import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_setup_model.dart';
export 'payment_setup_model.dart';

/// Registration Fee page — replaces the old Payment Setup (bank/PayPal) form.
/// Shows a Cashfree-branded fee card (₹1) and a "What you get" benefits list.
/// On "Pay ₹1 & Continue", navigates to TermsAndConditions which handles
/// the actual Cashfree checkout and service creation.
class PaymentSetupWidget extends StatefulWidget {
  const PaymentSetupWidget({
    super.key,
    required this.serviceCategory,
  });

  final String? serviceCategory;

  static String routeName = 'PaymentSetup';
  static String routePath = '/paymentSetup';

  @override
  State<PaymentSetupWidget> createState() => _PaymentSetupWidgetState();
}

class _PaymentSetupWidgetState extends State<PaymentSetupWidget> {
  late PaymentSetupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSetupModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          actions: const [],
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Page heading ──────────────────────────────────────
                    Text(
                      'Complete Registration',
                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                            fontSize: 28.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                    ).animate().fadeIn(duration: 350.ms).slideY(begin: -0.1, end: 0, duration: 350.ms, curve: Curves.easeOut),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        'One-time registration fee to list your profile and start receiving bookings.',
                        style: FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                      ),
                    ).animate().fadeIn(delay: 100.ms, duration: 350.ms),

                    const SizedBox(height: 24.0),

                    // ── Cashfree payment card ─────────────────────────────
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D1B2A),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CF brand row
                          Row(
                            children: [
                              Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00C853),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'CF',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cashfree Payments',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    'Secure · Fast · Trusted',
                                    style: GoogleFonts.inter(
                                      color: Colors.white54,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 24.0),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.15),
                            thickness: 1.0,
                          ),
                          const SizedBox(height: 16.0),

                          // Fee breakdown
                          _buildFeeRow(
                            label: 'Registration fee',
                            amount: '₹1',
                            isTotal: false,
                          ),
                          const SizedBox(height: 10.0),
                          _buildFeeRow(
                            label: 'GST (if applicable)',
                            amount: '₹0.00',
                            isTotal: false,
                          ),

                          const SizedBox(height: 16.0),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.15),
                            thickness: 1.0,
                          ),
                          const SizedBox(height: 16.0),

                          // Total
                          _buildFeeRow(
                            label: 'Total Due',
                            amount: '₹1',
                            isTotal: true,
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 200.ms, duration: 450.ms).scale(begin: const Offset(0.96, 0.96), end: const Offset(1, 1), delay: 200.ms, duration: 450.ms, curve: Curves.easeOutBack),

                    const SizedBox(height: 28.0),

                    // ── What you get ──────────────────────────────────────
                    Text(
                      'What you get',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                          ),
                    ).animate().fadeIn(delay: 350.ms, duration: 350.ms),
                    const SizedBox(height: 16.0),

                    _buildBenefit(
                      context: context,
                      icon: Icons.verified_outlined,
                      iconColor: const Color(0xFF00C853),
                      iconBg: const Color(0xFFE8F5E9),
                      title: 'Verified Provider Badge',
                      subtitle: 'Build trust with potential clients instantly.',
                    ).animate().fadeIn(delay: 450.ms, duration: 350.ms).slideX(begin: 0.12, end: 0, delay: 450.ms, duration: 350.ms, curve: Curves.easeOut),
                    const SizedBox(height: 12.0),
                    _buildBenefit(
                      context: context,
                      icon: Icons.calendar_today_outlined,
                      iconColor: const Color(0xFF1976D2),
                      iconBg: const Color(0xFFE3F2FD),
                      title: 'Unlimited Bookings',
                      subtitle: 'Accept bookings from customers across the platform.',
                    ).animate().fadeIn(delay: 550.ms, duration: 350.ms).slideX(begin: 0.12, end: 0, delay: 550.ms, duration: 350.ms, curve: Curves.easeOut),
                    const SizedBox(height: 12.0),
                    _buildBenefit(
                      context: context,
                      icon: Icons.lock_outlined,
                      iconColor: const Color(0xFFF57C00),
                      iconBg: const Color(0xFFFFF3E0),
                      title: 'Secure Payments',
                      subtitle: 'Get paid directly to your bank account, hassle-free.',
                    ).animate().fadeIn(delay: 650.ms, duration: 350.ms).slideX(begin: 0.12, end: 0, delay: 650.ms, duration: 350.ms, curve: Curves.easeOut),
                    const SizedBox(height: 12.0),
                    _buildBenefit(
                      context: context,
                      icon: Icons.people_outline,
                      iconColor: const Color(0xFF7B1FA2),
                      iconBg: const Color(0xFFF3E5F5),
                      title: 'Instant Visibility',
                      subtitle: 'Go live immediately — your profile shown to users right away.',
                    ).animate().fadeIn(delay: 750.ms, duration: 350.ms).slideX(begin: 0.12, end: 0, delay: 750.ms, duration: 350.ms, curve: Curves.easeOut),
                    const SizedBox(height: 12.0),
                    _buildBenefit(
                      context: context,
                      icon: Icons.star_border_outlined,
                      iconColor: const Color(0xFFC62828),
                      iconBg: const Color(0xFFFFEBEE),
                      title: 'Ratings & Reviews',
                      subtitle: 'Build your reputation and grow your client base.',
                    ).animate().fadeIn(delay: 850.ms, duration: 350.ms).slideX(begin: 0.12, end: 0, delay: 850.ms, duration: 350.ms, curve: Curves.easeOut),
                  ],
                ),
              ),
            ),

            // ── Pay button ────────────────────────────────────────────────
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
              padding: const EdgeInsets.all(15.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    TermsAndConditionsWidget.routeName,
                    queryParameters: {
                      'serviceCategory': serializeParam(
                        widget.serviceCategory,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
                text: 'Pay ₹1 & Continue',
                options: FFButtonOptions(
                  height: 54.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                showLoadingIndicator: false,
              ),
            ).animate().fadeIn(delay: 600.ms, duration: 400.ms).slideY(begin: 0.3, end: 0, delay: 600.ms, duration: 400.ms, curve: Curves.easeOut),
          ],
        ),
      ),
    );
  }

  /// Fee row widget for the dark Cashfree card
  Widget _buildFeeRow({
    required String label,
    required String amount,
    required bool isTotal,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: isTotal ? Colors.white : Colors.white70,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16.0 : 14.0,
          ),
        ),
        Text(
          amount,
          style: GoogleFonts.inter(
            color: isTotal ? const Color(0xFF00C853) : Colors.white70,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 22.0 : 14.0,
          ),
        ),
      ],
    );
  }

  /// Benefit item card
  Widget _buildBenefit({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).optionalColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: iconColor, size: 24.0),
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                      ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        lineHeight: 1.4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
