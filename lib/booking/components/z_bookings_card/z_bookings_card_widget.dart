import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'z_bookings_card_model.dart';
export 'z_bookings_card_model.dart';

class ZBookingsCardWidget extends StatefulWidget {
  const ZBookingsCardWidget({
    super.key,
    required this.bookingDoc,
  });

  final MyBookingsRecord? bookingDoc;

  @override
  State<ZBookingsCardWidget> createState() => _ZBookingsCardWidgetState();
}

class _ZBookingsCardWidgetState extends State<ZBookingsCardWidget>
    with TickerProviderStateMixin {
  late ZBookingsCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZBookingsCardModel());

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) safeSetState(() {});
    });
  }

  Future<void> validateAndUpdateStatus() async {
    if (widget.bookingDoc == null) return;

    final now = DateTime.now();
    final bookingDate = widget.bookingDoc?.bookingDate;
    final status = widget.bookingDoc?.snapshotData['status'] as String? ?? 'in_progress';

    if (bookingDate != null) {
      // Transition point: currentTime >= bookingDate
      if (now.isAfter(bookingDate) || now.isAtSameMomentAs(bookingDate)) {
        // Only auto-complete if status is in_progress or accepted (legacy)
        if (status == 'in_progress' || status == 'accepted' || status == 'pending') {
          // Update database status to completed
          await widget.bookingDoc!.reference.update({
            'status': 'completed',
            'completed': true,
          });
        }
      }
    }
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
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(widget.bookingDoc!.user!),
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

                  final rowUsersRecord = snapshot.data!;

                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 64.0,
                        height: 64.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              rowUsersRecord.photoUrl,
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Builder(
                                  builder: (context) {
                                    final now = DateTime.now();
                                    final bookingDate = widget.bookingDoc?.bookingDate;
                                    final status = widget.bookingDoc?.snapshotData['status'] as String? ?? 'in_progress';
                                    
                                    // Consider past bookings as completed automatically
                                    bool isPast = bookingDate != null && (now.isAfter(bookingDate) || now.isAtSameMomentAs(bookingDate));
                                    bool isCompleted = status == 'completed' || (isPast && !['rejected', 'cancelled', 'cancelled_by_user', 'pending', 'pending_approval'].contains(status));

                                    // Pending approval status (waiting for provider)
                                    if (status == 'pending' || status == 'pending_approval') {
                                      return Text(
                                        'Pending approval',
                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                          font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                          color: FlutterFlowTheme.of(context).warning,
                                          letterSpacing: 0.0,
                                        ),
                                      );
                                    } else if (status == 'rejected') {
                                      return Text(
                                        'Rejected',
                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                          font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                          color: FlutterFlowTheme.of(context).error,
                                          letterSpacing: 0.0,
                                        ),
                                      );
                                    } else if (status == 'cancelled_by_user' || status == 'cancelled') {
                                      return Text(
                                        'Cancelled by user',
                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                          font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                      );
                                    } else {
                                      // Trigger background update if mismatch found during render
                                      // Removed automatic update call

                                      return Text(
                                        isCompleted ? 'Completed' : 'In progress',
                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                          ),
                                          color: isCompleted
                                              ? FlutterFlowTheme.of(context).secondaryText
                                              : FlutterFlowTheme.of(context).success,
                                          letterSpacing: 0.0,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  rowUsersRecord.displayName,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  rowUsersRecord.phoneNumber != ''
                                      ? rowUsersRecord.phoneNumber
                                      : rowUsersRecord.email,
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              // Accept/Reject buttons for pending bookings (provider view) - PLACED AT TOP
              Builder(
                builder: (context) {
                  final status = widget.bookingDoc?.snapshotData['status'] as String? ?? 'in_progress';
                  // Show Accept/Reject for pending or pending_approval status
                  if ((status == 'pending' || status == 'pending_approval') && currentUserDocument?.service == widget.bookingDoc?.service) {
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Accept button
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                // Update status to in_progress (approved by provider)
                                await widget.bookingDoc!.reference.update({
                                  'status': 'in_progress',
                                });
                                // Notify the user
                                await NotificationsRecord.createDoc(
                                  widget.bookingDoc!.user!,
                                ).set(createNotificationsRecordData(
                                  title: 'Booking Approved',
                                  description: 'Your booking has been approved! It is now in progress.',
                                  type: 'booking_accepted',
                                  timeStamp: getCurrentTimestamp,
                                  read: false,
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Booking approved!'),
                                    backgroundColor: FlutterFlowTheme.of(context).success,
                                  ),
                                );
                              },
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).success,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Accept',
                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                        font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.0),
                          // Reject button
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                await widget.bookingDoc!.reference.update({
                                  'status': 'rejected',
                                });
                                // Notify the user
                                await NotificationsRecord.createDoc(
                                  widget.bookingDoc!.user!,
                                ).set(createNotificationsRecordData(
                                  title: 'Booking Rejected',
                                  description: 'Sorry, your booking request has been declined.',
                                  type: 'booking_rejected',
                                  timeStamp: getCurrentTimestamp,
                                  read: false,
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Booking rejected.'),
                                    backgroundColor: FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              },
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Reject',
                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                        font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Booking date: ',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                            lineHeight: 1.0,
                          ),
                    ),
                    Text(
                      '${dateTimeFormat(
                        "yMMMd",
                        widget.bookingDoc?.bookingDate,
                        locale: FFLocalizations.of(context).languageCode,
                      )} ${dateTimeFormat(
                        "jm",
                        widget.bookingDoc?.bookingDate,
                        locale: FFLocalizations.of(context).languageCode,
                      )}',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                            lineHeight: 1.0,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              // Only show "View booking details" button for in_progress bookings
              Builder(
                builder: (context) {
                  final status = widget.bookingDoc?.snapshotData['status'] as String? ?? 'in_progress';
                  final now = DateTime.now();
                  final bookingDate = widget.bookingDoc?.bookingDate;
                  
                  // Show "Mark as Completed" button ONLY for providers when booking is in_progress
                  if (status == 'in_progress' && currentUserDocument?.service == widget.bookingDoc?.service) {
                    return FFButtonWidget(
                      onPressed: () async {
                        await widget.bookingDoc!.reference.update({
                          'status': 'completed',
                          'completed': true,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Booking marked as completed!'),
                            backgroundColor: FlutterFlowTheme.of(context).success,
                          ),
                        );
                      },
                      text: 'Mark as Completed',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).success,
                        textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  }

                  // Hide "View booking details" button for completed, rejected, cancelled bookings
                  if (status == 'completed' || status == 'rejected' || status == 'cancelled' || status == 'cancelled_by_user') {
                    return SizedBox.shrink();
                  }
                  
                  return FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        BookingsDetailsWidget.routeName,
                        queryParameters: {
                          'bookingDoc': serializeParam(
                            widget.bookingDoc,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'bookingDoc': widget.bookingDoc,
                        },
                      );
                    },
                    text: 'View booking details',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
