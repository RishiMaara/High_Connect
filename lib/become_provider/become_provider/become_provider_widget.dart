import '/flutter_flow/custom_icons.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'become_provider_model.dart';
export 'become_provider_model.dart';

class BecomeProviderWidget extends StatefulWidget {
  const BecomeProviderWidget({super.key});

  static String routeName = 'BecomeProvider';
  static String routePath = '/becomeProvider';

  @override
  State<BecomeProviderWidget> createState() => _BecomeProviderWidgetState();
}

class _BecomeProviderWidgetState extends State<BecomeProviderWidget>
    with SingleTickerProviderStateMixin {
  late BecomeProviderModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  static const _features = [
    _Feature(
      icon: FFIcons.kpin,
      title: 'Get More Job Opportunities',
      body:
          'Get HIGH Listed. Get Hired. Join our network of verified civil engineers and put your profile in front of people who need your skills. Connect directly with local clients and build your legacy.',
      gradient: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    ),
    _Feature(
      icon: FFIcons.kclock,
      title: 'Set Your Own Schedule',
      body:
          'Work on your own terms by choosing when and where you want to provide services. Enjoy the flexibility to balance your work and personal life.',
      gradient: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
    ),
    _Feature(
      icon: FFIcons.klock01,
      title: 'Get Discovered Locally',
      body:
          'Appear in search results for users in your city or region looking for engineers with your exact expertise. Advanced filters mean you only get contacted for projects that match your skills.',
      gradient: [Color(0xFF10B981), Color(0xFF34D399)],
    ),
    _Feature(
      icon: FFIcons.ktrendUp01,
      title: 'Build Your Digital Reputation',
      body:
          'Collect and display ratings and reviews from completed projects directly on your profile. Use your HIGH Connect profile as a digital portfolio to win more trust and more business.',
      gradient: [Color(0xFFF59E0B), Color(0xFFEF4444)],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BecomeProviderModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // ── Scrollable content ─────────────────────────────────
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // ── Hero image with collapsible app bar ───────────
                  SliverAppBar(
                    expandedHeight: 240,
                    pinned: true,
                    backgroundColor: theme.secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: Padding(
                      padding: const EdgeInsets.all(8),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 22,
                        buttonSize: 44,
                        icon: Icon(Icons.arrow_back_ios_new_rounded,
                            color: theme.primaryText, size: 22),
                        onPressed: () => context.safePop(),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/images/welcomeProvider.png',
                              fit: BoxFit.cover,
                            ),
                            // Dark gradient overlay for legibility
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Color(0x99000000),
                                  ],
                                  stops: [0.5, 1.0],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .scale(
                              begin: const Offset(1.05, 1.05),
                              end: const Offset(1.0, 1.0),
                              duration: 600.ms,
                              curve: Curves.easeOut),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Badge ─────────────────────────────────
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: theme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.verified_rounded,
                                    color: theme.primary, size: 15),
                                const SizedBox(width: 5),
                                Text(
                                  'HIGH Connect Pro Circle',
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primary),
                                ),
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(delay: 150.ms, duration: 350.ms)
                              .slideY(begin: 0.2, end: 0, delay: 150.ms, duration: 350.ms),

                          const SizedBox(height: 12),

                          // ── Headline ──────────────────────────────
                          Text(
                            'You\'re in! Welcome to the\nHIGH Connect Pro Circle',
                            style: GoogleFonts.inter(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              height: 1.25,
                              color: theme.primaryText,
                            ),
                          )
                              .animate()
                              .fadeIn(delay: 220.ms, duration: 400.ms)
                              .slideY(begin: 0.15, end: 0, delay: 220.ms, duration: 400.ms),

                          const SizedBox(height: 12),

                          // ── Subtitle ──────────────────────────────
                          Text(
                            'Join HIGH Connect and start connecting with clients who need your expertise. Whether you specialize in structural design, site development, or geotechnics — grow your business on your terms.',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              height: 1.65,
                              color: theme.secondaryText,
                            ),
                          )
                              .animate()
                              .fadeIn(delay: 300.ms, duration: 400.ms)
                              .slideY(begin: 0.1, end: 0, delay: 300.ms, duration: 400.ms),

                          const SizedBox(height: 28),

                          // ── Progress steps ─────────────────────────
                          _ProgressSteps(theme: theme)
                              .animate()
                              .fadeIn(delay: 370.ms, duration: 350.ms),

                          const SizedBox(height: 28),

                          Text(
                            'Why Join Us',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: theme.primaryText),
                          )
                              .animate()
                              .fadeIn(delay: 420.ms, duration: 300.ms),

                          const SizedBox(height: 14),

                          // ── Feature Cards ─────────────────────────
                          ...List.generate(_features.length, (i) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _FeatureCard(
                                feature: _features[i],
                                bg: theme.secondaryBackground,
                                textColor: theme.primaryText,
                                subtextColor: theme.secondaryText,
                              )
                                  .animate()
                                  .fadeIn(
                                      delay: Duration(milliseconds: 470 + i * 80),
                                      duration: 400.ms)
                                  .slideY(
                                      begin: 0.2,
                                      end: 0,
                                      delay: Duration(milliseconds: 470 + i * 80),
                                      duration: 400.ms),
                            );
                          }),

                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── CTA Button pinned at bottom ────────────────────────
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                  20, 12, 20, MediaQuery.of(context).padding.bottom + 12),
              decoration: BoxDecoration(
                color: theme.primaryBackground,
                border: Border(
                    top: BorderSide(
                        color: theme.primaryText.withOpacity(0.07), width: 1)),
              ),
              child: FFButtonWidget(
                onPressed: () =>
                    context.pushNamed(PersonalInformationWidget.routeName),
                text: 'Get Started →',
                options: FFButtonOptions(
                  height: 54,
                  color: theme.primary,
                  textStyle: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  elevation: 0,
                  borderRadius: BorderRadius.circular(14),
                ),
              )
                  .animate(onPlay: (c) => c.repeat(reverse: true))
                  .scaleXY(begin: 1.0, end: 1.01, duration: 1200.ms,
                      curve: Curves.easeInOut),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────

class _Feature {
  const _Feature({
    required this.icon,
    required this.title,
    required this.body,
    required this.gradient,
  });
  final IconData icon;
  final String title;
  final String body;
  final List<Color> gradient;
}

// ── Feature Card ──────────────────────────────────────────────────────────────

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.feature,
    required this.bg,
    required this.textColor,
    required this.subtextColor,
  });
  final _Feature feature;
  final Color bg;
  final Color textColor;
  final Color subtextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textColor.withOpacity(0.07), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: feature.gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(feature.icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(feature.title,
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: textColor)),
                const SizedBox(height: 6),
                Text(feature.body,
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

// ── Progress Steps ────────────────────────────────────────────────────────────

class _ProgressSteps extends StatelessWidget {
  const _ProgressSteps({required this.theme});
  final dynamic theme;

  @override
  Widget build(BuildContext context) {
    final steps = ['Personal Info', 'Documents', 'Payment', 'Live'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Registration Steps',
            style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: theme.secondaryText)),
        const SizedBox(height: 10),
        Row(
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isOdd) {
              return Expanded(
                child: Container(
                  height: 2,
                  color: theme.primary.withOpacity(0.25),
                ),
              );
            }
            final stepIndex = i ~/ 2;
            return Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: stepIndex == 0
                        ? theme.primary
                        : theme.primary.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${stepIndex + 1}',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: stepIndex == 0
                            ? Colors.white
                            : theme.primary),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  steps[stepIndex],
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: stepIndex == 0
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: stepIndex == 0
                          ? theme.primary
                          : theme.secondaryText),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
