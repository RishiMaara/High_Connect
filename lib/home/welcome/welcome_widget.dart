import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_model.dart';
export 'welcome_model.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  static String routeName = 'Welcome';
  static String routePath = '/welcome';

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget>
    with SingleTickerProviderStateMixin {
  late WelcomeModel _model;
  late AnimationController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeModel());
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
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
        backgroundColor: theme.optionalColor2,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // ── Back button ────────────────────────────────────
                GestureDetector(
                  onTap: () => context.safePop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: theme.primaryText.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.arrow_back_ios_new_rounded,
                        size: 18, color: theme.primaryText),
                  ),
                )
                    .animate()
                    .fadeIn(duration: 300.ms)
                    .slideX(begin: -0.3, end: 0, duration: 300.ms),

                const SizedBox(height: 32),

                // ── Brand Logo / Icon ──────────────────────────────
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.primary, theme.primary.withOpacity(0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: theme.primary.withOpacity(0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.bolt_rounded,
                      color: Colors.white, size: 36),
                )
                    .animate()
                    .fadeIn(delay: 50.ms, duration: 400.ms)
                    .slideY(begin: -0.4, end: 0, duration: 450.ms,
                        curve: Curves.easeOutBack),

                const SizedBox(height: 28),

                // ── Headline ───────────────────────────────────────
                Text(
                  'Welcome to\nHigh Connect',
                  style: GoogleFonts.inter(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    color: theme.primaryText,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 150.ms, duration: 400.ms)
                    .slideY(begin: 0.2, end: 0,
                        delay: 150.ms, duration: 400.ms),

                const SizedBox(height: 12),

                // ── Subtitle ───────────────────────────────────────
                Text(
                  'Select your path to sign in — where skilled engineers meet your needs seamlessly.',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    height: 1.6,
                    color: theme.secondaryText,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 250.ms, duration: 400.ms)
                    .slideY(begin: 0.15, end: 0,
                        delay: 250.ms, duration: 400.ms),

                const Spacer(),

                // ── Sign In as Provider ────────────────────────────
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      SiggInWidget.routeName,
                      queryParameters: {
                        'provider': serializeParam(true, ParamType.bool),
                      }.withoutNulls,
                    );
                  },
                  text: 'Sign In as a Provider',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 54,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: theme.primary,
                    textStyle: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(14),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 400.ms)
                    .slideY(begin: 0.3, end: 0,
                        delay: 400.ms, duration: 400.ms),

                const SizedBox(height: 12),

                // ── Sign In ────────────────────────────────────────
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      SiggInWidget.routeName,
                      queryParameters: {
                        'provider': serializeParam(false, ParamType.bool),
                      }.withoutNulls,
                    );
                  },
                  text: 'Sign In',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 54,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: theme.accent1,
                    textStyle: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: theme.primary,
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(14),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 480.ms, duration: 400.ms)
                    .slideY(begin: 0.3, end: 0,
                        delay: 480.ms, duration: 400.ms),

                const SizedBox(height: 14),

                // ── Google Sign In ─────────────────────────────────
                GestureDetector(
                  onTap: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    final user = await authManager.signInWithGoogle(context);
                    if (user == null) return;
                    context.goNamedAuth(
                        HomePageWidget.routeName, context.mounted);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      color: theme.secondaryBackground,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: theme.primaryText.withOpacity(0.1), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Container(
                          width: 28,
                          height: 28,
                          clipBehavior: Clip.antiAlias,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset('assets/images/gg.png',
                              fit: BoxFit.cover),
                        ),
                        Expanded(
                          child: Text(
                            'Continue with Google',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: theme.primaryText,
                            ),
                          ),
                        ),
                        const SizedBox(width: 44),
                      ],
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 560.ms, duration: 400.ms)
                    .slideY(begin: 0.3, end: 0,
                        delay: 560.ms, duration: 400.ms),

                const SizedBox(height: 28),

                // ── Sign Up link ───────────────────────────────────
                Center(
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: GoogleFonts.inter(
                              fontSize: 14, color: theme.secondaryText),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: theme.primary,
                          ),
                          mouseCursor: SystemMouseCursors.click,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              context.pushNamed(
                                SignUpWidget.routeName,
                                queryParameters: {
                                  'provider':
                                      serializeParam(false, ParamType.bool),
                                }.withoutNulls,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 650.ms, duration: 350.ms),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
