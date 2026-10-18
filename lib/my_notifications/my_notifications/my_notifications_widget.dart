import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/empty/empty_notifications/empty_notifications_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading/l_notifications/l_notifications_widget.dart';
import '/my_notifications/z_notifications_card/z_notifications_card_widget.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_notifications_model.dart';
export 'my_notifications_model.dart';

class MyNotificationsWidget extends StatefulWidget {
  const MyNotificationsWidget({super.key});

  static String routeName = 'MyNotifications';
  static String routePath = '/myNotifications';

  @override
  State<MyNotificationsWidget> createState() => _MyNotificationsWidgetState();
}

class _MyNotificationsWidgetState extends State<MyNotificationsWidget> {
  late MyNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyNotificationsModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            FFAppState().selectedNotificationa.isNotEmpty
                ? FFAppState().selectedNotificationa.length.toString()
                : 'My notifications',
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
          actions: [

            Visibility(
              visible: FFAppState().selectedNotificationa.isNotEmpty,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 6.0, 6.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 22.0,
                        buttonSize: 44.0,
                        fillColor: FlutterFlowTheme.of(context).transparent,
                        icon: Icon(
                          FFIcons.ktrash03,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          while (
                              FFAppState().selectedNotificationa.length > 0) {
                            _model.notificationRef =
                                FFAppState().selectedNotificationa.firstOrNull;
                            safeSetState(() {});
                            FFAppState().removeFromSelectedNotificationa(
                                _model.notificationRef!);
                            _model.updatePage(() {});
                            await _model.notificationRef!.delete();
                            _model.notificationRef = null;
                            safeSetState(() {});
                          }
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 6.0, 6.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 22.0,
                        buttonSize: 44.0,
                        fillColor: FlutterFlowTheme.of(context).transparent,
                        icon: Icon(
                          FFIcons.kmail04,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          while (
                              FFAppState().selectedNotificationa.length > 0) {
                            _model.notificationRef =
                                FFAppState().selectedNotificationa.firstOrNull;
                            safeSetState(() {});
                            FFAppState().removeFromSelectedNotificationa(
                                _model.notificationRef!);
                            _model.updatePage(() {});

                            await _model.notificationRef!
                                .update(createNotificationsRecordData(
                              read: true,
                            ));
                            _model.notificationRef = null;
                            safeSetState(() {});
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ),
          centerTitle:
              FFAppState().selectedNotificationa.isNotEmpty ? false : true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (FFAppState().selectedNotificationa.isNotEmpty)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().allNotifications != true) {
                    _model.notificationsList =
                        await queryNotificationsRecordOnce(
                      parent: currentUserReference,
                    );
                    FFAppState().allNotifications = true;
                    FFAppState().selectedNotificationa = _model
                        .notificationsList!
                        .map((e) => e.reference)
                        .toList()
                        .cast<DocumentReference>();
                    safeSetState(() {});
                  } else {
                    FFAppState().allNotifications = false;
                    FFAppState().selectedNotificationa = [];
                    safeSetState(() {});
                  }

                  safeSetState(() {});
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: FFAppState().allNotifications
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).transparent,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: FFAppState().allNotifications
                                  ? FlutterFlowTheme.of(context).transparent
                                  : FlutterFlowTheme.of(context).icons,
                              width: FFAppState().allNotifications ? 0.0 : 1.5,
                            ),
                          ),
                          child: Visibility(
                            visible: FFAppState().allNotifications,
                            child: Icon(
                              FFIcons.kcheck,
                              color: FlutterFlowTheme.of(context).info,
                              size: 18.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            FFAppState().allNotifications == true
                                ? 'Deselect All'
                                : 'Select All',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: StreamBuilder<List<NotificationsRecord>>(
                stream: queryNotificationsRecord(
                  parent: currentUserReference,
                  queryBuilder: (notificationsRecord) => notificationsRecord
                      .orderBy('time_stamp', descending: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return LNotificationsWidget();
                  }
                  List<NotificationsRecord> listViewNotificationsRecordList =
                      snapshot.data!;
                  if (listViewNotificationsRecordList.isEmpty) {
                    return EmptyNotificationsWidget();
                  }

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      15.0,
                      0,
                      15.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewNotificationsRecordList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewNotificationsRecord =
                          listViewNotificationsRecordList[listViewIndex];
                      return wrapWithModel(
                        model: _model.zNotificationsCardModels.getModel(
                          listViewIndex.toString(),
                          listViewIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: ZNotificationsCardWidget(
                          key: Key(
                            'Keytys_${listViewIndex.toString()}',
                          ),
                          notificationDoc: listViewNotificationsRecord,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
