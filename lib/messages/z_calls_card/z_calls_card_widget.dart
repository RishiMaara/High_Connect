import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'z_calls_card_model.dart';
export 'z_calls_card_model.dart';

class ZCallsCardWidget extends StatefulWidget {
  const ZCallsCardWidget({
    super.key,
    required this.callDoc,
  });

  final CallsRecord? callDoc;

  @override
  State<ZCallsCardWidget> createState() => _ZCallsCardWidgetState();
}

class _ZCallsCardWidgetState extends State<ZCallsCardWidget> {
  late ZCallsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZCallsCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(functions.noMyRef(
            widget.callDoc!.usersRef.toList(), currentUserReference!)),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 35.0,
                height: 35.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }

          final containerUsersRecord = snapshot.data!;

          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 56.0,
                    height: 56.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      containerUsersRecord.photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            containerUsersRecord.displayName,
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
                                  lineHeight: 1.0,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.callDoc?.outgoing ==
                                      currentUserReference) {
                                    return Icon(
                                      FFIcons.karrowNarrowUpRight,
                                      color: widget.callDoc!.callAccepted
                                          ? FlutterFlowTheme.of(context).success
                                          : FlutterFlowTheme.of(context).error,
                                      size: 20.0,
                                    );
                                  } else {
                                    return Icon(
                                      FFIcons.karrowNarrowDownLeft,
                                      color: widget.callDoc!.callAccepted
                                          ? FlutterFlowTheme.of(context).success
                                          : FlutterFlowTheme.of(context).error,
                                      size: 20.0,
                                    );
                                  }
                                },
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    dateTimeFormat(
                                      "yMMMd",
                                      widget.callDoc!.callTime!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ).maybeHandleOverflow(
                                      maxChars: 20,
                                      replacement: '…',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final phoneNumber = containerUsersRecord.phoneNumber;
                        if (phoneNumber.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Phone number not available.'),
                              backgroundColor: FlutterFlowTheme.of(context).error,
                            ),
                          );
                          return;
                        }
                        // Copy phone number to clipboard
                        await Clipboard.setData(ClipboardData(text: phoneNumber));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Phone number copied to clipboard'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        // Log call in Firestore
                        await CallsRecord.collection.doc().set({
                          ...createCallsRecordData(
                            callAccepted: true,
                            callType: 0,
                            callTime: getCurrentTimestamp,
                            outgoing: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'users_ref': functions.usersRefList(
                                  containerUsersRecord.reference,
                                  currentUserReference!),
                            },
                          ),
                        });
                        // Open native phone dialer
                        await launchUrl(Uri(
                          scheme: 'tel',
                          path: phoneNumber,
                        ));
                      },
                      child: Builder(
                        builder: (context) {
                          if (widget.callDoc?.callType == 0) {
                            return Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FFIcons.kphoneCall01,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            );
                          } else {
                            return Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FFIcons.kvideoRecorder,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
