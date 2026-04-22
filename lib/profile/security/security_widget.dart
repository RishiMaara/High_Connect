import '/auth/firebase_auth/auth_util.dart';
import '/buttons/text_right/text_right_widget.dart';
import '/buttons/text_switch/text_switch_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'security_model.dart';
export 'security_model.dart';

class SecurityWidget extends StatefulWidget {
  const SecurityWidget({super.key});

  static String routeName = 'Security';
  static String routePath = '/security';

  @override
  State<SecurityWidget> createState() => _SecurityWidgetState();
}

class _SecurityWidgetState extends State<SecurityWidget> {
  late SecurityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecurityModel());

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
            'Security',
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().faceID) {
                  FFAppState().faceID = false;
                  safeSetState(() {});
                } else {
                  FFAppState().faceID = true;
                  safeSetState(() {});
                }
              },
              child: wrapWithModel(
                model: _model.textSwitchModel1,
                updateCallback: () => safeSetState(() {}),
                child: TextSwitchWidget(
                  title: 'Face ID',
                  switchField: FFAppState().faceID,
                  showDivider: true,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().touchID) {
                  FFAppState().touchID = false;
                  safeSetState(() {});
                } else {
                  FFAppState().touchID = true;
                  safeSetState(() {});
                }
              },
              child: wrapWithModel(
                model: _model.textSwitchModel2,
                updateCallback: () => safeSetState(() {}),
                child: TextSwitchWidget(
                  title: 'Touch ID',
                  switchField: FFAppState().touchID,
                  showDivider: true,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().rememberMe) {
                  FFAppState().rememberMe = false;
                  safeSetState(() {});
                } else {
                  FFAppState().rememberMe = true;
                  safeSetState(() {});
                }
              },
              child: wrapWithModel(
                model: _model.textSwitchModel3,
                updateCallback: () => safeSetState(() {}),
                child: TextSwitchWidget(
                  title: 'Remember me',
                  switchField: FFAppState().rememberMe,
                  showDivider: true,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().smsAuthenticator) {
                  FFAppState().smsAuthenticator = false;
                  safeSetState(() {});
                } else {
                  FFAppState().smsAuthenticator = true;
                  safeSetState(() {});
                }
              },
              child: wrapWithModel(
                model: _model.textSwitchModel4,
                updateCallback: () => safeSetState(() {}),
                child: TextSwitchWidget(
                  title: 'SMS authenticator',
                  switchField: FFAppState().smsAuthenticator,
                  showDivider: true,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().googleAuthenticator) {
                  FFAppState().googleAuthenticator = false;
                  safeSetState(() {});
                } else {
                  FFAppState().googleAuthenticator = true;
                  safeSetState(() {});
                }
              },
              child: wrapWithModel(
                model: _model.textSwitchModel5,
                updateCallback: () => safeSetState(() {}),
                child: TextSwitchWidget(
                  title: 'Google authenticator',
                  switchField: FFAppState().googleAuthenticator,
                  showDivider: true,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  ResetPasswordWidget.routeName,
                  queryParameters: {
                    'provider': serializeParam(
                      valueOrDefault<bool>(
                          currentUserDocument?.inService, false),
                      ParamType.bool,
                    ),
                  }.withoutNulls,
                );
              },
              child: wrapWithModel(
                model: _model.textRightModel,
                updateCallback: () => safeSetState(() {}),
                child: TextRightWidget(
                  content: 'Change password',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
