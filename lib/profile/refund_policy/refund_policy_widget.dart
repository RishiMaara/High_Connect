import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'refund_policy_model.dart';
export 'refund_policy_model.dart';

class RefundPolicyWidget extends StatefulWidget {
  const RefundPolicyWidget({super.key});

  static String routeName = 'RefundPolicy';
  static String routePath = '/refundPolicy';

  @override
  State<RefundPolicyWidget> createState() => _RefundPolicyWidgetState();
}

class _RefundPolicyWidgetState extends State<RefundPolicyWidget> {
  late RefundPolicyModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<_PolicyPoint> _points = [
    _PolicyPoint(
      icon: Icons.account_circle_outlined,
      iconColor: Color(0xFF3B82F6),
      bgColor: Color(0xFFEFF6FF),
      title: 'One-Time Profile Charge',
      body:
          'When registering as a service provider, a one-time profile charge is collected. This is the only fee collected by our application.',
      tag: 'Service Profile',
      tagColor: Color(0xFF3B82F6),
    ),
    _PolicyPoint(
      icon: Icons.block_outlined,
      iconColor: Color(0xFFF59E0B),
      bgColor: Color(0xFFFFFBEB),
      title: 'Strictly Non-Refundable',
      body:
          'The profile creation charge is strictly non-refundable under any circumstances. Once the fee is paid and the profile is active, no refunds will be issued.',
      tag: 'No Refunds',
      tagColor: Color(0xFFF59E0B),
    ),
    _PolicyPoint(
      icon: Icons.handshake_outlined,
      iconColor: Color(0xFF10B981),
      bgColor: Color(0xFFECFDF5),
      title: 'Direct Service Payments',
      body:
          'We simply connect people to hire services. All payments for the actual services rendered must be negotiated and settled directly between the user and the provider.',
      tag: 'Direct Settlement',
      tagColor: Color(0xFF10B981),
    ),
    _PolicyPoint(
      icon: Icons.gavel_outlined,
      iconColor: Color(0xFFEF4444),
      bgColor: Color(0xFFFEF2F2),
      title: 'No Platform Liability',
      body:
          'S MART ASSOCIATES is not responsible for any interactions, disputes, damages, or occurrences that happen between users and service providers after the connection is made.',
      tag: 'No Liability',
      tagColor: Color(0xFFEF4444),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RefundPolicyModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        appBar: AppBar(
          backgroundColor: theme.secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 22.0,
              buttonSize: 44.0,
              icon: Icon(Icons.arrow_back_ios_new_rounded,
                  color: theme.primaryText, size: 22.0),
              onPressed: () => context.safePop(),
            ),
          ),
          title: Text(
            'Refund Policy',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: theme.primaryText,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // ── Header Banner ──────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF10B981), Color(0xFF059669)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.currency_rupee_rounded,
                          color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cancellation & Refund',
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          const SizedBox(height: 4),
                          Text('Last updated: April 22, 2026',
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.85))),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: -0.2, end: 0, duration: 400.ms),

              const SizedBox(height: 16),

              // ── Intro card ──────────────────────────────────────────
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: theme.primaryText.withOpacity(0.06), width: 1),
                ),
                child: Text(
                  'S MART ASSOCIATES acts as a platform connecting users with service professionals. We only collect a one-time fee for service profile creation. Please review our policy below.',
                  style: GoogleFonts.inter(
                      fontSize: 13.5,
                      height: 1.65,
                      color: theme.secondaryText),
                ),
              )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 350.ms),

              const SizedBox(height: 20),



              Text(
                'Policy Details',
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryText),
              ).animate().fadeIn(delay: 200.ms, duration: 300.ms),

              const SizedBox(height: 12),

              // ── Policy Point Cards ─────────────────────────────────
              ...List.generate(_points.length, (i) {
                final p = _points[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _PolicyCard(point: p, bg: theme.secondaryBackground, textColor: theme.primaryText, subtextColor: theme.secondaryText)
                      .animate()
                      .fadeIn(
                          delay: Duration(milliseconds: 250 + i * 65),
                          duration: 350.ms)
                      .slideY(
                          begin: 0.15,
                          end: 0,
                          delay: Duration(milliseconds: 250 + i * 65),
                          duration: 350.ms),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────

class _PolicyPoint {
  const _PolicyPoint({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.body,
    required this.tag,
    required this.tagColor,
  });
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String body;
  final String tag;
  final Color tagColor;
}

// ── Policy Card ───────────────────────────────────────────────────────────────

class _PolicyCard extends StatelessWidget {
  const _PolicyCard(
      {required this.point,
      required this.bg,
      required this.textColor,
      required this.subtextColor});
  final _PolicyPoint point;
  final Color bg;
  final Color textColor;
  final Color subtextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textColor.withOpacity(0.07), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: point.bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(point.icon, color: point.iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(point.title,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: point.tagColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(point.tag,
                          style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: point.tagColor)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(point.body,
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        height: 1.6,
                        color: subtextColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Timeline helpers ──────────────────────────────────────────────────────────

class _TimelineStep extends StatelessWidget {
  const _TimelineStep(
      {required this.step, required this.label, required this.color});
  final String step;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 1.5)),
          alignment: Alignment.center,
          child: Text(step,
              style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: color)),
        ),
        const SizedBox(height: 6),
        Text(label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 10,
                height: 1.4,
                color: color.withOpacity(0.85))),
      ],
    );
  }
}

class _Arrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Icon(Icons.arrow_forward_ios_rounded,
          size: 12, color: Colors.grey),
    );
  }
}
