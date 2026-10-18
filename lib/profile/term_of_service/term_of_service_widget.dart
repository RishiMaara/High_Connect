import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'term_of_service_model.dart';
export 'term_of_service_model.dart';

class TermOfServiceWidget extends StatefulWidget {
  const TermOfServiceWidget({super.key});

  static String routeName = 'TermOfService';
  static String routePath = '/termOfService';

  @override
  State<TermOfServiceWidget> createState() => _TermOfServiceWidgetState();
}

class _TermOfServiceWidgetState extends State<TermOfServiceWidget> {
  late TermOfServiceModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _sections = [
    {
      'icon': Icons.person_outline_rounded,
      'title': 'Account & Registration',
      'body':
          'To access and use the Services, you agree to provide true, accurate and complete information to us during and after registration, and you shall be responsible for all acts done through the use of your registered account.',
    },
    {
      'icon': Icons.shield_outlined,
      'title': 'No Warranty',
      'body':
          'Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials offered on this website or through the Services, for any specific purpose.',
    },
    {
      'icon': Icons.gavel_rounded,
      'title': 'Intellectual Property',
      'body':
          'The contents of the Website and the Services are proprietary to Us and you will not have any authority to claim any intellectual property rights, title, or interest in its contents.',
    },
    {
      'icon': Icons.link_rounded,
      'title': 'Third-Party Links',
      'body':
          'You agree and acknowledge that the website and the Services may contain links to other third-party websites. On accessing these links, you will be governed by the terms of use, privacy policy and such other policies of such third-party websites.',
    },
    {
      'icon': Icons.payments_outlined,
      'title': 'Payments & Refunds',
      'body':
          'You agree to pay us the charges associated with availing the Services. You shall be entitled to claim a refund if we are not able to provide the Service within the timelines specified in our policies.',
    },
    {
      'icon': Icons.block_rounded,
      'title': 'Prohibited Use',
      'body':
          'You agree not to use the website and/or Services for any purpose that is unlawful, illegal or forbidden by these Terms, or Indian or local laws that might apply to you.',
    },
    {
      'icon': Icons.balance_rounded,
      'title': 'Governing Law & Jurisdiction',
      'body':
          'These Terms and any dispute or claim relating to it shall be governed by and construed in accordance with the laws of India. All disputes shall be subject to the exclusive jurisdiction of the courts in COIMBATORE NORTH, TAMIL NADU.',
    },
    {
      'icon': Icons.contact_support_outlined,
      'title': 'Contact & Concerns',
      'body':
          'All concerns or communications relating to these Terms must be communicated to us using the contact information provided on this website.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermOfServiceModel());
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
            'Terms of Service',
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
              // ── Header Banner ──────────────────────────────────────
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [theme.primary, theme.primary.withOpacity(0.75)],
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
                      child: const Icon(Icons.description_outlined,
                          color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Terms of Service',
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

              // ── Intro ──────────────────────────────────────────────
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: theme.primaryText.withOpacity(0.06), width: 1),
                ),
                child: Text(
                  'These Terms and Conditions constitute a binding agreement between S MART ASSOCIATES ("we", "us") and you regarding your use of our Services. By using our platform, you agree to these Terms.',
                  style: GoogleFonts.inter(
                      fontSize: 13.5,
                      height: 1.65,
                      color: theme.secondaryText),
                ),
              )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 350.ms)
                  .slideY(begin: 0.15, end: 0, duration: 350.ms),

              const SizedBox(height: 20),

              // ── Section heading ────────────────────────────────────
              Text(
                'Key Clauses',
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryText),
              )
                  .animate()
                  .fadeIn(delay: 150.ms, duration: 300.ms),

              const SizedBox(height: 12),

              // ── Animated Sections ──────────────────────────────────
              ...List.generate(_sections.length, (i) {
                final s = _sections[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _SectionCard(
                    icon: s['icon'] as IconData,
                    title: s['title'] as String,
                    body: s['body'] as String,
                    accentColor: theme.primary,
                    bgColor: theme.secondaryBackground,
                    textColor: theme.primaryText,
                    subtextColor: theme.secondaryText,
                  )
                      .animate()
                      .fadeIn(
                          delay: Duration(milliseconds: 200 + i * 60),
                          duration: 350.ms)
                      .slideY(
                          begin: 0.15,
                          end: 0,
                          delay: Duration(milliseconds: 200 + i * 60),
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

class _SectionCard extends StatefulWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.body,
    required this.accentColor,
    required this.bgColor,
    required this.textColor,
    required this.subtextColor,
  });

  final IconData icon;
  final String title;
  final String body;
  final Color accentColor;
  final Color bgColor;
  final Color textColor;
  final Color subtextColor;

  @override
  State<_SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<_SectionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: _expanded
                ? widget.accentColor.withOpacity(0.35)
                : widget.textColor.withOpacity(0.07),
            width: 1),
        boxShadow: _expanded
            ? [
                BoxShadow(
                    color: widget.accentColor.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4))
              ]
            : [],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => setState(() => _expanded = !_expanded),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: widget.accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(widget.icon,
                        color: widget.accentColor, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.inter(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                          color: widget.textColor),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(Icons.keyboard_arrow_down_rounded,
                        color: widget.subtextColor, size: 22),
                  ),
                ],
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    widget.body,
                    style: GoogleFonts.inter(
                        fontSize: 13.5,
                        height: 1.65,
                        color: widget.subtextColor),
                  ),
                ),
                crossFadeState: _expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 250),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
