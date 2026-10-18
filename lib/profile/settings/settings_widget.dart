import '/buttons/text_right/text_right_widget.dart';
import '/buttons/text_switch/text_switch_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/components/z_logout/z_logout_widget.dart';
import '/profile/components/z_delete_account/z_delete_account_widget.dart';
import '/profile/z_rate_app/z_rate_app_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'Settings';
  static String routePath = '/settings';

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

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
            'Settings',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 6.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).optionalColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'Notifications',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        lineHeight: 1.0,
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().notificationsSound) {
                    FFAppState().notificationsSound = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().notificationsSound = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Notifications sound',
                    switchField: FFAppState().notificationsSound,
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
                  if (FFAppState().notificationsVibration) {
                    FFAppState().notificationsVibration = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().notificationsVibration = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Notifications vibration',
                    switchField: FFAppState().notificationsVibration,
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
                  context.pushNamed(NotificationsManagerWidget.routeName);
                },
                child: wrapWithModel(
                  model: _model.textRightModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: TextRightWidget(
                    content: 'Notifications manager',
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
                  context.pushNamed(DoNotDisturbWidget.routeName);
                },
                child: wrapWithModel(
                  model: _model.textRightModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: TextRightWidget(
                    content: 'Do not disturb',
                    showDivider: true,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 6.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).optionalColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'Permissions',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        lineHeight: 1.0,
                      ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (FFAppState().location) {
                      FFAppState().location = false;
                      safeSetState(() {});
                    } else {
                      FFAppState().location = true;
                      safeSetState(() {});
                    }
                  },
                  child: wrapWithModel(
                    model: _model.textSwitchModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSwitchWidget(
                      title: 'Location',
                      switchField: FFAppState().location,
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (FFAppState().cameraPhotos) {
                      FFAppState().cameraPhotos = false;
                      safeSetState(() {});
                    } else {
                      FFAppState().cameraPhotos = true;
                      safeSetState(() {});
                    }
                  },
                  child: wrapWithModel(
                    model: _model.textSwitchModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSwitchWidget(
                      title: 'Camera & Photos',
                      switchField: FFAppState().cameraPhotos,
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (FFAppState().storageAccess) {
                      FFAppState().storageAccess = false;
                      safeSetState(() {});
                    } else {
                      FFAppState().storageAccess = true;
                      safeSetState(() {});
                    }
                  },
                  child: wrapWithModel(
                    model: _model.textSwitchModel6,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSwitchWidget(
                      title: 'Storage Access',
                      switchField: FFAppState().storageAccess,
                      showDivider: false,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 6.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).optionalColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'General',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        lineHeight: 1.0,
                      ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (FFAppState().darkMode) {
                      FFAppState().darkMode = false;
                      safeSetState(() {});
                      setDarkModeSetting(context, ThemeMode.light);
                    } else {
                      FFAppState().darkMode = true;
                      safeSetState(() {});
                      setDarkModeSetting(context, ThemeMode.dark);
                    }
                  },
                  child: wrapWithModel(
                    model: _model.textSwitchModel8,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSwitchWidget(
                      title: 'Dark mode',
                      switchField: FFAppState().darkMode,
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(LanguageWidget.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 15.0, 20.0),
                          child: Text(
                            'Language',
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            FFAppState().selectedLang.language,
                            'null',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Icon(
                        FFIcons.kchevronRight,
                        color: FlutterFlowTheme.of(context).icons,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 6.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'Others',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        lineHeight: 1.0,
                      ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(OurSocialsWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.textRightModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: TextRightWidget(
                      content: 'Our socials',
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(PrivacyPolicyWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.textRightModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: TextRightWidget(
                      content: 'Privacy policy',
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(TermOfServiceWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.textRightModel5,
                    updateCallback: () => safeSetState(() {}),
                    child: TextRightWidget(
                      content: 'Term of service',
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(RefundPolicyWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.textRightModel9,
                    updateCallback: () => safeSetState(() {}),
                    child: TextRightWidget(
                      content: 'Refund policy',
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Share.share(
                        '''Book this service on HIGH Connect:
https://play.google.com/store/apps/details?id=com.myhigh.connect

📲 Don't have the app? Install it:
https://play.google.com/store/apps/details?id=com.myhigh.connect''',
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                    child: wrapWithModel(
                      model: _model.textRightModel6,
                      updateCallback: () => safeSetState(() {}),
                      child: TextRightWidget(
                        content: 'Share the app',
                        showDivider: true,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showDialog(
                        barrierColor: FlutterFlowTheme.of(context).barrier,
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: ZRateAppWidget(),
                            ),
                          );
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.textRightModel8,
                      updateCallback: () => safeSetState(() {}),
                      child: TextRightWidget(
                        content: 'Rate the app',
                        showDivider: true,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await launchURL('https://high-connect-3.web.app');
                  },
                  child: wrapWithModel(
                    model: _model.textRightModel7,
                    updateCallback: () => safeSetState(() {}),
                    child: TextRightWidget(
                      content: 'Visit our website',
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      barrierColor: FlutterFlowTheme.of(context).barrier,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(dialogContext).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: ZDeleteAccountWidget(),
                          ),
                        );
                      },
                    );
                  },
                  child: wrapWithModel(
                    model: _model.textRightModel10,
                    updateCallback: () => safeSetState(() {}),
                    child: TextRightWidget(
                      content: 'Delete account',
                      showDivider: true,
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      barrierColor: FlutterFlowTheme.of(context).barrier,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(dialogContext).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: ZLogoutWidget(),
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 20.0, 15.0, 30.0),
                        child: Text(
                          'Logout',
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
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].addToEnd(SizedBox(height: 15.0)).animate(interval: 50.ms).fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0, duration: 300.ms, curve: Curves.easeOut),
          ),
        ),
      ),
    );
  }
}
