import '/buttons/text_switch/text_switch_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_manager_model.dart';
export 'notifications_manager_model.dart';

class NotificationsManagerWidget extends StatefulWidget {
  const NotificationsManagerWidget({super.key});

  static String routeName = 'NotificationsManager';
  static String routePath = '/notificationsManager';

  @override
  State<NotificationsManagerWidget> createState() =>
      _NotificationsManagerWidgetState();
}

class _NotificationsManagerWidgetState
    extends State<NotificationsManagerWidget> {
  late NotificationsManagerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsManagerModel());

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
                context.pop();
              },
            ),
          ),
          title: Text(
            'Notifications manager',
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
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'Booking',
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
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().bookingUpdates) {
                    FFAppState().bookingUpdates = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().bookingUpdates = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Booking Updates',
                    switchField: FFAppState().bookingUpdates,
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
                  if (FFAppState().serviceProvider) {
                    FFAppState().serviceProvider = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().serviceProvider = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Service Provider Updates',
                    switchField: FFAppState().serviceProvider,
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
                  if (FFAppState().jobCompletion) {
                    FFAppState().jobCompletion = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().jobCompletion = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Job Completion',
                    switchField: FFAppState().jobCompletion,
                    showDivider: false,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 6.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).optionalColor,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'Payment',
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
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().paymentNot) {
                    FFAppState().paymentNot = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().paymentNot = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Payment Notifications',
                    switchField: FFAppState().paymentNot,
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
                  if (FFAppState().invoiceReceipts) {
                    FFAppState().invoiceReceipts = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().invoiceReceipts = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Invoice & Receipts',
                    switchField: FFAppState().invoiceReceipts,
                    showDivider: false,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 6.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).optionalColor,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'Reviews and feedback',
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
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().reviewRequests) {
                    FFAppState().reviewRequests = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().reviewRequests = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Review Requests',
                    switchField: FFAppState().reviewRequests,
                    showDivider: true,
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
                    if (FFAppState().reviewResponses) {
                      FFAppState().reviewResponses = false;
                      safeSetState(() {});
                    } else {
                      FFAppState().reviewResponses = true;
                      safeSetState(() {});
                    }
                  },
                  child: wrapWithModel(
                    model: _model.textSwitchModel7,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSwitchWidget(
                      title: 'Review Responses',
                      switchField: FFAppState().reviewResponses,
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
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'Promos and discounts',
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
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().promotions) {
                    FFAppState().promotions = false;
                    safeSetState(() {});
                  } else {
                    FFAppState().promotions = true;
                    safeSetState(() {});
                  }
                },
                child: wrapWithModel(
                  model: _model.textSwitchModel8,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSwitchWidget(
                    title: 'Promotions & Offers',
                    switchField: FFAppState().promotions,
                    showDivider: true,
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
                    if (FFAppState().exclusiveDeals) {
                      FFAppState().exclusiveDeals = false;
                      safeSetState(() {});
                    } else {
                      FFAppState().exclusiveDeals = true;
                      safeSetState(() {});
                    }
                  },
                  child: wrapWithModel(
                    model: _model.textSwitchModel9,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSwitchWidget(
                      title: 'Exclusive Deals',
                      switchField: FFAppState().exclusiveDeals,
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
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'System Notifications',
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
                    if (FFAppState().securityAlerts) {
                      FFAppState().securityAlerts = false;
                      safeSetState(() {});
                    } else {
                      FFAppState().securityAlerts = true;
                      safeSetState(() {});
                    }
                  },
                  child: wrapWithModel(
                    model: _model.textSwitchModel10,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSwitchWidget(
                      title: 'Security Alerts',
                      switchField: FFAppState().securityAlerts,
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
                    if (FFAppState().appUpdates) {
                      FFAppState().appUpdates = false;
                      safeSetState(() {});
                    } else {
                      FFAppState().appUpdates = true;
                      safeSetState(() {});
                    }
                  },
                  child: wrapWithModel(
                    model: _model.textSwitchModel11,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSwitchWidget(
                      title: 'App Updates & Tips',
                      switchField: FFAppState().appUpdates,
                      showDivider: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
