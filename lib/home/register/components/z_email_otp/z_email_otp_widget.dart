import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import '/services/email_otp_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class ZEmailOtpWidget extends StatefulWidget {
  const ZEmailOtpWidget({
    super.key,
    required this.email,
    required this.password,
    this.provider = false,
  });

  final String email;
  final String password;
  final bool provider;

  @override
  State<ZEmailOtpWidget> createState() => _ZEmailOtpWidgetState();
}

class _ZEmailOtpWidgetState extends State<ZEmailOtpWidget> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  bool _isLoading = false;
  bool _isResending = false;
  String _errorMessage = '';
  int _resendTimer = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startResendTimer() {
    _resendTimer = 60;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() => _resendTimer--);
      } else {
        timer.cancel();
      }
    });
  }

  String get _otpCode {
    return _controllers.map((c) => c.text).join();
  }

  Future<void> _verifyOtp() async {
    if (_otpCode.length != 6) {
      setState(() => _errorMessage = 'Please enter the complete 6-digit code');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      // Verify OTP with Cloud Function
      final verified = await EmailOtpService.verifyOtp(widget.email, _otpCode);

      if (verified) {
        // OTP verified - now create the Firebase account
        GoRouter.of(context).prepareAuthEvent();
        
        final user = await authManager.createAccountWithEmail(
          context,
          widget.email,
          widget.password,
          false, // createDocument: false
        );

        if (user == null) {
          setState(() => _errorMessage = 'Failed to create account. Please try again.');
          return;
        }

        // Explicitly create the document with our custom data
        await UsersRecord.collection.doc(user.uid).set(createUsersRecordData(
          email: widget.email.trim(),
          emailSignUp: true,
          createdTime: getCurrentTimestamp,
        ));

        // Navigate to home
        context.goNamedAuth(HomePageWidget.routeName, context.mounted);
      }
    } catch (e) {
      setState(() => _errorMessage = e.toString().replaceAll('Exception: ', ''));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _resendOtp() async {
    if (_resendTimer > 0) return;

    setState(() {
      _isResending = true;
      _errorMessage = '';
    });

    try {
      await EmailOtpService.sendOtp(widget.email);
      _startResendTimer();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('New code sent to ${widget.email}'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      setState(() => _errorMessage = e.toString().replaceAll('Exception: ', ''));
    } finally {
      setState(() => _isResending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            'Verify Email',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Icon(
                  Icons.email_outlined,
                  size: 80,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                SizedBox(height: 24),
                Text(
                  'Verification Code',
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                SizedBox(height: 12),
                Text(
                  'We sent a 6-digit code to\n${widget.email}',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
                SizedBox(height: 40),
                // OTP Input Fields
                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 45,
                        height: 55,
                        child: TextFormField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: FlutterFlowTheme.of(context).headlineSmall,
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2,
                              ),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              _focusNodes[index + 1].requestFocus();
                            } else if (value.isEmpty && index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }
                            // Auto-verify when 6 digits entered
                            if (_otpCode.length == 6) {
                              _verifyOtp();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 16),
                if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      _errorMessage,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(),
                            color: FlutterFlowTheme.of(context).error,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(height: 24),
                // Verify Button
                FFButtonWidget(
                  onPressed: _isLoading ? null : _verifyOtp,
                  text: _isLoading ? 'Verifying...' : 'Verify',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.inter(),
                          color: Colors.white,
                        ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(height: 24),
                // Resend Code
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code? ",
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    if (_resendTimer > 0)
                      Text(
                        'Resend in ${_resendTimer}s',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(),
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      )
                    else
                      GestureDetector(
                        onTap: _isResending ? null : _resendOtp,
                        child: Text(
                          _isResending ? 'Sending...' : 'Resend',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(),
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
