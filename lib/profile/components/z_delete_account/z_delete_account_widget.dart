import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_delete_account_model.dart';
export 'z_delete_account_model.dart';

class ZDeleteAccountWidget extends StatefulWidget {
  const ZDeleteAccountWidget({super.key});

  @override
  State<ZDeleteAccountWidget> createState() => _ZDeleteAccountWidgetState();
}

class _ZDeleteAccountWidgetState extends State<ZDeleteAccountWidget>
    with TickerProviderStateMixin {
  late ZDeleteAccountModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZDeleteAccountModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _startDeletion() async {
    FFAppState().isAuthLoading = true;
    safeSetState(() {});

    try {
      await authManager.deleteUser(context);
      // If success, user is logged out automatically by Firebase
      if (context.mounted) {
        Navigator.pop(context);
        context.goNamedAuth('Onboarding', false);
      }
    } on Exception catch (e) {
      final errorStr = e.toString();
      if (errorStr.contains('requires-recent-login')) {
        // Switch to OTP mode
        _model.showOtpField = true;
        
        // Start phone auth for re-authentication
        final phoneNumber = currentPhoneNumber;
        if (phoneNumber.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: Phone number not found for re-authentication.')),
          );
          return;
        }

        await authManager.beginPhoneAuth(
          context: context,
          phoneNumber: phoneNumber,
          onCodeSent: (ctx) {
            _model.timerController.onStartTimer();
            safeSetState(() {});
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete account. Please try again.')),
        );
      }
    } finally {
      FFAppState().isAuthLoading = false;
      safeSetState(() {});
    }
  }

  Future<void> _verifyAndAccountDelete(String smsCode) async {
    FFAppState().isAuthLoading = true;
    safeSetState(() {});

    try {
      await authManager.reauthenticateWithPhone(
        context: context,
        smsCode: smsCode,
      );
      // Re-auth success, now delete
      await authManager.deleteUser(context);
      
      if (context.mounted) {
        Navigator.pop(context);
        context.goNamedAuth('Onboarding', false);
      }
    } catch (e) {
      debugPrint('🔴 Re-auth/Delete Error: $e');
    } finally {
      FFAppState().isAuthLoading = false;
      safeSetState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).optionalColor2,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!_model.showOtpField) ...[
                  Text(
                    'Delete your account?',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.inter(),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'This action is permanent and cannot be undone. All your data, bookings, and profile information will be deleted.',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () => Navigator.pop(context),
                            text: 'Cancel',
                            options: FFButtonOptions(
                              height: 45.0,
                              color: FlutterFlowTheme.of(context).optionalColor,
                              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.inter(),
                                    color: FlutterFlowTheme.of(context).primaryText,
                                  ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: _startDeletion,
                            text: FFAppState().isAuthLoading ? 'Please wait...' : 'Delete',
                            options: FFButtonOptions(
                              height: 45.0,
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.inter(),
                                    color: Colors.white,
                                  ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ] else ...[
                  Text(
                    'Re-verify Identity',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.inter(),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'For security, please enter the OTP sent to your registered phone number to confirm deletion.',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      textStyle: FlutterFlowTheme.of(context).headlineSmall,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: false,
                      autoFocus: true,
                      focusNode: _model.pinCodeFocusNode,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldHeight: 40.0,
                        fieldWidth: 40.0,
                        borderWidth: 1.0,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: PinCodeFieldShape.box,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        inactiveColor: FlutterFlowTheme.of(context).color,
                        selectedColor: FlutterFlowTheme.of(context).primary,
                      ),
                      controller: _model.pinCodeController,
                      onChanged: (val) {
                        if (val.length == 6) {
                          _verifyAndAccountDelete(val);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!_model.codeAgain)
                          Row(
                            children: [
                              Text('Resend in ', style: FlutterFlowTheme.of(context).labelSmall),
                              FlutterFlowTimer(
                                initialTime: 60000,
                                getDisplayTime: (v) => StopWatchTimer.getDisplayTime(v, hours: false, minute: false, milliSecond: false),
                                controller: _model.timerController,
                                onChanged: (value, displayTime, shouldUpdate) {
                                  _model.timerMilliseconds = value;
                                  _model.timerValue = displayTime;
                                  if (shouldUpdate) safeSetState(() {});
                                },
                                onEnded: () => setState(() => _model.codeAgain = true),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                      font: GoogleFonts.inter(),
                                      color: FlutterFlowTheme.of(context).primary,
                                    ),
                              ),
                              Text('s', style: FlutterFlowTheme.of(context).labelSmall),
                            ],
                          )
                        else
                          InkWell(
                            onTap: () async {
                              await authManager.beginPhoneAuth(
                                context: context,
                                phoneNumber: currentPhoneNumber,
                                onCodeSent: (ctx) {
                                  _model.codeAgain = false;
                                  _model.timerController.onResetTimer();
                                  _model.timerController.onStartTimer();
                                  safeSetState(() {});
                                },
                              );
                            },
                            child: Text('Resend Code', 
                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.inter(),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.bold,
                                  )),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () => Navigator.pop(context),
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 45.0,
                        color: FlutterFlowTheme.of(context).optionalColor,
                        textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.inter(),
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation']!,
      ),
    );
  }
}
