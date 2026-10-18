import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_util;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'o_t_p_code_verification_model.dart';
export 'o_t_p_code_verification_model.dart';

class OTPCodeVerificationWidget extends StatefulWidget {
  const OTPCodeVerificationWidget({
    super.key,
    required this.email,
    required this.otpCode,
    required this.provider,
    this.isSignup = false,
  });

  final String? email;
  final String? otpCode;
  final bool? provider;
  final bool isSignup;

  static String routeName = 'OTPCodeVerification';
  static String routePath = '/oTPCodeVerification';

  @override
  State<OTPCodeVerificationWidget> createState() =>
      _OTPCodeVerificationWidgetState();
}

class _OTPCodeVerificationWidgetState extends State<OTPCodeVerificationWidget> {
  late OTPCodeVerificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OTPCodeVerificationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      _model.otpCode = widget.otpCode!;
      safeSetState(() {});
    });

    _model.pinCodeFocusNode ??= FocusNode();

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
                context.pop();
              },
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OTP Code Verification',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    lineHeight: 1.5,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 8.0, 30.0, 0.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'We’ve sent a 6-digit OTP code to your email ',
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
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                    TextSpan(
                      text: widget.email!,
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    TextSpan(
                      text: '. Enter the code below to verify your identity.',
                      style: TextStyle(),
                    )
                  ],
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
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                        lineHeight: 1.5,
                      ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 32.0, 15.0, 0.0),
                child: PinCodeTextField(
                  autoDisposeControllers: false,
                  appContext: context,
                  length: 6,
                  textStyle:
                      FlutterFlowTheme.of(context).headlineMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  enableActiveFill: false,
                  autoFocus: true,
                  focusNode: _model.pinCodeFocusNode,
                  enablePinAutofill: true,
                  errorTextSpace: 16.0,
                  showCursor: true,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    fieldHeight: 48.0,
                    fieldWidth: 48.0,
                    borderWidth: 1.0,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    shape: PinCodeFieldShape.box,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    inactiveColor: FlutterFlowTheme.of(context).color,
                    selectedColor: FlutterFlowTheme.of(context).primary,
                    activeFillColor: FlutterFlowTheme.of(context).transparent,
                    inactiveFillColor: FlutterFlowTheme.of(context).accent1,
                    selectedFillColor: FlutterFlowTheme.of(context).accent1,
                  ),
                  controller: _model.pinCodeController,
                  onChanged: (_) async {
                    final smsCodeVal = _model.pinCodeController!.text;
                    // Only attempt auto-verification once all 6 digits are entered
                    if (smsCodeVal.length != 6) return;
                    // Prevent duplicate calls if already verifying
                    if (FFAppState().isAuthLoading) return;

                    FFAppState().isAuthLoading = true;
                    safeSetState(() {});
                    try {
                      GoRouter.of(context).prepareAuthEvent();
                      final phoneVerifiedUser = await authManager.verifySmsCode(
                        context: context,
                        smsCode: smsCodeVal,
                      );
                      if (phoneVerifiedUser == null) {
                        // verifySmsCode already showed an error snackbar
                        return;
                      }
                      context.goNamedAuth(
                          HomePageWidget.routeName, context.mounted);
                    } finally {
                      FFAppState().isAuthLoading = false;
                      if (mounted) safeSetState(() {});
                    }
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                  validator:
                      _model.pinCodeControllerValidator.asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 8.0, 15.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (_model.codeAgain) {
                    return RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Didn\'t receive the code? ',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          TextSpan(
                            text: 'Resend now',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            mouseCursor: SystemMouseCursors.click,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                _model.codeAgain = false;
                                _model.otpCode = random_util
                                    .randomInteger(100000, 999999)
                                    .toString();
                                safeSetState(() {});

                                // Always use Firestore mail collection (Firebase Trigger Email extension)
                                try {
                                  await FirebaseFirestore.instance
                                      .collection('mail')
                                      .add({
                                    'to': [widget.email],
                                    'message': {
                                      'subject': 'Your PlanB Verification Code',
                                      'text': 'Your verification code is ${_model.otpCode}',
                                    },
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Verification code sent!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error sending code. Please try again.'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                }
                                _model.timerController.onStartTimer();
                              },
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                      ),
                    );
                  } else {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Resend code in ',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                        FlutterFlowTimer(
                          initialTime: _model.timerInitialTimeMs,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            minute: false,
                            milliSecond: false,
                          ),
                          controller: _model.timerController,
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) safeSetState(() {});
                          },
                          onEnded: () async {
                            _model.codeAgain = true;
                            safeSetState(() {});
                          },
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          's',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (FFAppState().isAuthLoading) return;

                  if (_model.otpCode == _model.pinCodeController!.text) {
                    FFAppState().isAuthLoading = true;
                    try {
                      if (widget.isSignup) {
                        GoRouter.of(context).prepareAuthEvent();

                        final user = await authManager.createAccountWithEmail(
                          context,
                          widget.email!,
                          FFAppState().tempSignupPassword,
                        );
                        if (user == null) {
                          return;
                        }

                        await UsersRecord.collection
                            .doc(user.uid)
                            .update(createUsersRecordData(
                              email: widget.email!,
                              emailSignUp: true,
                            ));

                        // Clear temporary password
                        FFAppState().tempSignupPassword = '';

                        context.goNamedAuth(
                            HomePageWidget.routeName, context.mounted);
                      } else {
                        context.pushNamed(
                          SetNewPasswordWidget.routeName,
                          queryParameters: {
                            'email': serializeParam(
                              widget.email,
                              ParamType.String,
                            ),
                            'provider': serializeParam(
                              widget.provider,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );
                      }
                    } finally {
                      FFAppState().isAuthLoading = false;
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid OTP. Please try again.'),
                      ),
                    );
                  }
                },
                text: 'Confirm',
                isLoading: FFAppState().isAuthLoading,
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
