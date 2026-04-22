import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/booking/components/optionals_buttons/optionals_buttons_widget.dart';
import '/booking/components/z_cancel_booking/z_cancel_booking_widget.dart';
import '/booking/components/z_report_bug/z_report_bug_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'z_bookings_optional_model.dart';
export 'z_bookings_optional_model.dart';

class ZBookingsOptionalWidget extends StatefulWidget {
  const ZBookingsOptionalWidget({
    super.key,
    required this.bookingDoc,
    required this.serviceDoc,
  });

  final MyBookingsRecord? bookingDoc;
  final ServicesRecord? serviceDoc;

  @override
  State<ZBookingsOptionalWidget> createState() =>
      _ZBookingsOptionalWidgetState();
}

class _ZBookingsOptionalWidgetState extends State<ZBookingsOptionalWidget>
    with TickerProviderStateMixin {
  late ZBookingsOptionalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZBookingsOptionalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (animationsMap['containerOnActionTriggerAnimation'] != null) {
        await animationsMap['containerOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 15.0, 0.0),
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: FlutterFlowTheme.of(context).shadow,
              offset: Offset(
                0.0,
                0.0,
              ),
              spreadRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (animationsMap['containerOnActionTriggerAnimation'] !=
                    null) {
                  await animationsMap['containerOnActionTriggerAnimation']!
                      .controller
                      .reverse();
                }
                Navigator.pop(context);
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ZReportBugWidget(),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: wrapWithModel(
                model: _model.optionalsButtonsModel1,
                updateCallback: () => safeSetState(() {}),
                child: OptionalsButtonsWidget(
                  text: 'Report bugs',
                  icon: Icon(
                    FFIcons.kalertCircle,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (animationsMap['containerOnActionTriggerAnimation'] !=
                    null) {
                  await animationsMap['containerOnActionTriggerAnimation']!
                      .controller
                      .reverse();
                }
                Navigator.pop(context);

                context.pushNamed(
                  ChatWidget.routeName,
                  queryParameters: {
                    'userRef': serializeParam(
                      valueOrDefault<bool>(
                              currentUserDocument?.inService, false)
                          ? widget.bookingDoc?.user
                          : widget.serviceDoc?.provider,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              },
              child: wrapWithModel(
                model: _model.optionalsButtonsModel2,
                updateCallback: () => safeSetState(() {}),
                child: OptionalsButtonsWidget(
                  text: 'Chat',
                  icon: Icon(
                    FFIcons.kmessage,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final phoneNumber = valueOrDefault<bool>(
                        currentUserDocument?.inService, false)
                    ? widget.bookingDoc?.phoneNumber ?? ''
                    : widget.serviceDoc?.phoneNumber ?? '';
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
                          valueOrDefault<bool>(
                                  currentUserDocument?.inService, false)
                              ? widget.bookingDoc!.user!
                              : widget.serviceDoc!.provider!,
                          currentUserReference!),
                    },
                  ),
                });
                if (animationsMap['containerOnActionTriggerAnimation'] !=
                    null) {
                  await animationsMap['containerOnActionTriggerAnimation']!
                      .controller
                      .reverse();
                }
                Navigator.pop(context);
                // Open native phone dialer
                await launchUrl(Uri(
                  scheme: 'tel',
                  path: phoneNumber,
                ));
              },
              child: wrapWithModel(
                model: _model.optionalsButtonsModel3,
                updateCallback: () => safeSetState(() {}),
                child: OptionalsButtonsWidget(
                  text: 'Call ',
                  icon: Icon(
                    FFIcons.kphoneCall01,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 3.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
            // Cancel booking option - only show for pending_approval or in_progress statuses
            Builder(
              builder: (context) {
                final status = widget.bookingDoc?.snapshotData['status'] as String? ?? 'in_progress';
                // Show Cancel only for pending_approval, pending, or in_progress AND not completed
                if (!['pending_approval', 'pending', 'in_progress', 'accepted'].contains(status) || 
                    widget.bookingDoc?.completed == true) {
                  return SizedBox.shrink();
                }
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (animationsMap['containerOnActionTriggerAnimation'] !=
                        null) {
                      await animationsMap['containerOnActionTriggerAnimation']!
                          .controller
                          .reverse();
                    }
                    Navigator.pop(context);
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
                          child: ZCancelBookingWidget(
                            bookingRef: widget.bookingDoc!.reference,
                          ),
                        );
                      },
                    );
                  },
                  child: wrapWithModel(
                    model: _model.optionalsButtonsModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: OptionalsButtonsWidget(
                      text: 'Cancel booking',
                      icon: Icon(
                        FFIcons.ktrash03,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation']!,
      ),
    );
  }
}
