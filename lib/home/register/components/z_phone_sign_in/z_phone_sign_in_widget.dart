import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/register/components/z_continue_with/z_continue_with_widget.dart';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_phone_sign_in_model.dart';
export 'z_phone_sign_in_model.dart';

class ZPhoneSignInWidget extends StatefulWidget {
  const ZPhoneSignInWidget({
    super.key,
    required this.provider,
  });

  final bool? provider;

  @override
  State<ZPhoneSignInWidget> createState() => _ZPhoneSignInWidgetState();
}

class _ZPhoneSignInWidgetState extends State<ZPhoneSignInWidget> {
  late ZPhoneSignInModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZPhoneSignInModel());

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.phoneNumberTextController?.text = '';
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.phoneNumberTextController,
                    focusNode: _model.phoneNumberFocusNode,
                    autofocus: false,
                    enabled: true,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    maxLength: 10,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      isDense: false,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                                lineHeight: 1.0,
                              ),
                      hintText: 'Phone number ',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                                lineHeight: 1.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).optionalColor,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                          lineHeight: 1.0,
                        ),
                    keyboardType: TextInputType.number,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model.phoneNumberTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    String phoneInput =
                        _model.phoneNumberTextController.text.trim();
                    // Remove any non-digit characters
                    phoneInput = phoneInput.replaceAll(RegExp(r'[^0-9]'), '');

                    // Validate exactly 10 digits
                    if (phoneInput.length != 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Please enter exactly 10 digit phone number.'),
                        ),
                      );
                      return;
                    }

                    // Add +91 country code for India
                    final String phoneNumberVal = '+91$phoneInput';

                    FFAppState().isAuthLoading = true;
                    safeSetState(() {});
                    
                    try {
                      // Note: Skip pre-auth user check to avoid Firestore permission errors
                      // Firebase Phone Auth will handle user creation/login automatically
                      await authManager.beginPhoneAuth(
                        context: context,
                        phoneNumber: phoneNumberVal,
                        onCodeSent: (context) async {
                          FFAppState().isAuthLoading = false;
                          // Navigate to SMS Phone Verification screen (not email OTP)
                          context.goNamedAuth(
                            SmsPhoneVerificationWidget.routeName,
                            context.mounted,
                            queryParameters: {
                              'phoneNumber': serializeParam(
                                phoneInput,
                                ParamType.String,
                              ),
                              'provider': serializeParam(
                                widget.provider,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                            ignoreRedirect: true,
                          );
                        },
                      );
                    } catch (e) {
                      FFAppState().isAuthLoading = false;
                      safeSetState(() {});
                      
                      // Show actual error for debugging
                      debugPrint('🔴 Phone Sign-In Error: $e');
                      String errorMessage = 'Phone auth error: ${e.toString().split(':').last.trim()}';
                      final errorStr = e.toString().toLowerCase();
                      
                      if (errorStr.contains('invalid-phone-number')) {
                        errorMessage = 'Invalid phone number. Please check and try again.';
                      } else if (errorStr.contains('too-many-requests')) {
                        errorMessage = 'Too many attempts. Please wait a few minutes.';
                      } else if (errorStr.contains('quota')) {
                        errorMessage = 'SMS quota exceeded. Please try again later.';
                      } else if (errorStr.contains('network')) {
                        errorMessage = 'Network error. Please check your connection.';
                      } else if (errorStr.contains('user not found') || errorStr.contains('no account')) {
                        errorMessage = 'No account found with this phone number.';
                      }
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                          duration: Duration(seconds: 5),
                        ),
                      );
                    }
                  },
                  text: 'Sign in',
                  isLoading: FFAppState().isAuthLoading,
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
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
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.zContinueWithModel,
                updateCallback: () => safeSetState(() {}),
                child: ZContinueWithWidget(),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                                  ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primary,
                            fontWeight: FontWeight.w500,
                          ),
                          mouseCursor: SystemMouseCursors.click,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              context.pushNamed(
                                SignUpWidget.routeName,
                                queryParameters: {
                                  'provider': serializeParam(
                                    widget.provider,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            },
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
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
