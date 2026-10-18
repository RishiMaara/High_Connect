import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'z_notifications_card_model.dart';
export 'z_notifications_card_model.dart';

class ZNotificationsCardWidget extends StatefulWidget {
  const ZNotificationsCardWidget({
    super.key,
    required this.notificationDoc,
  });

  final NotificationsRecord? notificationDoc;

  @override
  State<ZNotificationsCardWidget> createState() =>
      _ZNotificationsCardWidgetState();
}

class _ZNotificationsCardWidgetState extends State<ZNotificationsCardWidget> {
  late ZNotificationsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZNotificationsCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (FFAppState().selectedNotificationa.isNotEmpty) {
            if (FFAppState()
                .selectedNotificationa
                .contains(widget.notificationDoc?.reference)) {
              FFAppState().removeFromSelectedNotificationa(
                  widget.notificationDoc!.reference);
              FFAppState().update(() {});
            } else {
              FFAppState().addToSelectedNotificationa(
                  widget.notificationDoc!.reference);
              FFAppState().update(() {});
            }
          } else {
            if (widget.notificationDoc != null && widget.notificationDoc!.read == false) {
              await widget.notificationDoc!.reference.update(createNotificationsRecordData(
                read: true,
              ));
            }
          }
        },
        onLongPress: () async {
          if (FFAppState()
              .selectedNotificationa
              .contains(widget.notificationDoc?.reference)) {
            FFAppState().removeFromSelectedNotificationa(
                widget.notificationDoc!.reference);
            FFAppState().update(() {});
          } else {
            FFAppState()
                .addToSelectedNotificationa(widget.notificationDoc!.reference);
            FFAppState().update(() {});
          }
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FFAppState()
                    .selectedNotificationa
                    .contains(widget.notificationDoc?.reference)
                ? FlutterFlowTheme.of(context).accent1
                : FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              final type = widget.notificationDoc?.type;
                              final isSelected = FFAppState().selectedNotificationa.contains(widget.notificationDoc?.reference);

                              if (isSelected) {
                                return Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    FFIcons.kcheck,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                );
                              }

                              // Specific Icon and Color mapping based on notification type
                              IconData iconData;
                              Color bgColor;
                              Color iconColor;

                              switch (type) {
                                case 'error':
                                case 'booking_rejected':
                                  iconData = FFIcons.kalertTrianglew1;
                                  bgColor = FlutterFlowTheme.of(context).errorAccent;
                                  iconColor = FlutterFlowTheme.of(context).error;
                                  break;
                                case 'warning':
                                case 'booking_cancelled':
                                  iconData = FFIcons.kalertCirclew1;
                                  bgColor = FlutterFlowTheme.of(context).warningAccent;
                                  iconColor = FlutterFlowTheme.of(context).warning;
                                  break;
                                case 'info':
                                case 'booking_request':
                                  iconData = FFIcons.kinfoCirclew1;
                                  bgColor = FlutterFlowTheme.of(context).accent1;
                                  iconColor = FlutterFlowTheme.of(context).primary;
                                  break;
                                case 'success':
                                case 'booking_accepted':
                                case 'booking_completed':
                                  // Success/confirmation types keep checkmark
                                  iconData = FFIcons.kcheckCirclew1;
                                  bgColor = FlutterFlowTheme.of(context).successAccent;
                                  iconColor = FlutterFlowTheme.of(context).success;
                                  break;
                                case 'message':
                                case 'chat':
                                  // Message notifications use chat icon
                                  iconData = FFIcons.kmessageSquare02;
                                  bgColor = FlutterFlowTheme.of(context).accent1;
                                  iconColor = FlutterFlowTheme.of(context).primary;
                                  break;
                                default:
                                  // Default/system notifications use bell icon
                                  iconData = FFIcons.kbell01w1;
                                  bgColor = FlutterFlowTheme.of(context).accent1;
                                  iconColor = FlutterFlowTheme.of(context).primary;
                                  break;
                              }

                              return Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, (type == 'error' || type == 'booking_rejected') ? 5.0 : 0.0),
                                  child: Icon(
                                    iconData,
                                    color: iconColor,
                                    size: (type == 'error' || type == 'booking_rejected') ? 21.0 : 24.0,
                                  ),
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.notificationDoc?.title,
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      "relative",
                                      widget.notificationDoc!.timeStamp!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.notificationDoc?.read == false)
                      Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.notificationDoc?.description,
                      'null',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
