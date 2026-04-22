import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_util;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'booking_date_time_model.dart';
export 'booking_date_time_model.dart';

class BookingDateTimeWidget extends StatefulWidget {
  const BookingDateTimeWidget({
    super.key,
    required this.serviceDoc,
  });

  final ServicesRecord? serviceDoc;

  static String routeName = 'BookingDateTime';
  static String routePath = '/bookingDateTime';

  @override
  State<BookingDateTimeWidget> createState() => _BookingDateTimeWidgetState();
}

class _BookingDateTimeWidgetState extends State<BookingDateTimeWidget>
    with TickerProviderStateMixin {
  late BookingDateTimeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingDateTimeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final now = DateTime.now();
      final todayAtMidnight = DateTime(now.year, now.month, now.day);
      
      _model.availableDate = functions
          .customCalendar(now)
          .where((e) {
            final isAvailableDay = functions.matchingDays(
              widget.serviceDoc!.availableDays.toList(), e);
            // Ensure date is not in the past (today or future)
            final isNotPast = e.isAfter(todayAtMidnight) || e.isAtSameMomentAs(todayAtMidnight);
            return isAvailableDay && isNotPast;
          })
          .toList()
          .firstOrNull;
          
      if (_model.availableDate != null) {
        _model.availableTime = widget.serviceDoc?.availableTime
            .where((e) {
              final isNotBooked = !e.bokedDates.contains(_model.availableDate);
              
              // If it's today, check if the slot is in the future
              if (isNotBooked && _model.availableDate!.isAtSameMomentAs(todayAtMidnight)) {
                final slotDateTime = DateTime(
                  _model.availableDate!.year,
                  _model.availableDate!.month,
                  _model.availableDate!.day,
                  e.time!.hour,
                  e.time!.minute,
                );
                return slotDateTime.isAfter(now);
              }
              return isNotBooked;
            })
            .toList()
            .sortedList(keyOf: (e) => e.time!, desc: false)
            .firstOrNull;
      }
      safeSetState(() {});
    });

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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            'Booking',
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                      child: Text(
                        'Schedule your session',
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
                                  fontSize: 18.0,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final days = functions
                              .customCalendar(getCurrentTimestamp)
                              .toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(days.length, (daysIndex) {
                                final daysItem = days[daysIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final now = DateTime.now();
                                    final todayAtMidnight = DateTime(now.year, now.month, now.day);
                                    
                                    // Disable past dates
                                    if (daysItem.isBefore(todayAtMidnight)) {
                                      return;
                                    }

                                    if (functions.matchingDays(
                                            widget.serviceDoc!.availableDays
                                                .toList(),
                                            daysItem) ==
                                        true) {
                                      _model.availableDate = daysItem;
                                      safeSetState(() {});
                                      
                                      // If current selected time is booked or in the past for the new date
                                      bool isCurrentSlotInvalid = false;
                                      if (_model.availableTime != null) {
                                        if (_model.availableTime!.bokedDates.contains(daysItem)) {
                                          isCurrentSlotInvalid = true;
                                        } else if (daysItem.isAtSameMomentAs(todayAtMidnight)) {
                                          final slotDateTime = DateTime(
                                            daysItem.year,
                                            daysItem.month,
                                            daysItem.day,
                                            _model.availableTime!.time!.hour,
                                            _model.availableTime!.time!.minute,
                                          );
                                          if (!slotDateTime.isAfter(now)) {
                                            isCurrentSlotInvalid = true;
                                          }
                                        }
                                      }

                                      if (_model.availableTime == null || isCurrentSlotInvalid) {
                                        _model.availableTime = widget
                                            .serviceDoc?.availableTime
                                            .where((e) {
                                              final isNotBooked = !e.bokedDates.contains(_model.availableDate);
                                              if (isNotBooked && daysItem.isAtSameMomentAs(todayAtMidnight)) {
                                                final slotDateTime = DateTime(
                                                  daysItem.year,
                                                  daysItem.month,
                                                  daysItem.day,
                                                  e.time!.hour,
                                                  e.time!.minute,
                                                );
                                                return slotDateTime.isAfter(now);
                                              }
                                              return isNotBooked;
                                            })
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) => e.time!,
                                                desc: false)
                                            .firstOrNull;
                                        safeSetState(() {});
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 64.0,
                                    height: 86.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        final now = DateTime.now();
                                        final todayAtMidnight = DateTime(now.year, now.month, now.day);
                                        
                                        if (daysItem.isBefore(todayAtMidnight) || 
                                            functions.matchingDays(
                                                widget.serviceDoc!.availableDays
                                                    .toList(),
                                                daysItem) ==
                                            false) {
                                          return FlutterFlowTheme.of(context)
                                              .greyDriver;
                                        } else if (daysItem ==
                                            _model.availableDate) {
                                          return FlutterFlowTheme.of(context)
                                              .accent1;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: daysItem == _model.availableDate
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .transparent,
                                        width: _model.availableDate == daysItem
                                            ? 1.0
                                            : 0.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          functions.dayOfTheWeek(daysItem),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                                lineHeight: 1.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Text(
                                            functions.dateNumber(daysItem),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                                  .divide(SizedBox(width: 12.0))
                                  .addToStart(SizedBox(width: 15.0))
                                  .addToEnd(SizedBox(width: 15.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final now = DateTime.now();
                          final todayAtMidnight = DateTime(now.year, now.month, now.day);
                          
                          final startTime = widget.serviceDoc?.availableTime
                                  .where((e) {
                                    // Filter out booked dates
                                    if (e.bokedDates.contains(_model.availableDate)) {
                                      return false;
                                    }
                                    
                                    // If today, filter out past slots
                                    if (_model.availableDate != null && 
                                        _model.availableDate!.isAtSameMomentAs(todayAtMidnight)) {
                                      final slotDateTime = DateTime(
                                        _model.availableDate!.year,
                                        _model.availableDate!.month,
                                        _model.availableDate!.day,
                                        e.time!.hour,
                                        e.time!.minute,
                                      );
                                      return slotDateTime.isAfter(now);
                                    }
                                    
                                    return true;
                                  })
                                  .sortedList(
                                      keyOf: (e) => dateTimeFormat(
                                            "Hm",
                                            e.time!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                      desc: false)
                                  .toList() ??
                              [];

                          return Wrap(
                            spacing: 12.0,
                            runSpacing: 12.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: List.generate(startTime.length,
                                (startTimeIndex) {
                              final startTimeItem = startTime[startTimeIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (!startTimeItem.bokedDates
                                      .contains(_model.availableDate)) {
                                    _model.availableTime = startTimeItem;
                                    safeSetState(() {});
                                  }
                                },
                                child: Container(
                                  width:
                                      (MediaQuery.sizeOf(context).width - 54) /
                                          3,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      final now = DateTime.now();
                                      final todayAtMidnight = DateTime(now.year, now.month, now.day);
                                      
                                      bool isInvalid = startTimeItem.bokedDates.contains(_model.availableDate);
                                      
                                      if (!isInvalid && _model.availableDate != null && 
                                          _model.availableDate!.isAtSameMomentAs(todayAtMidnight)) {
                                        final slotDateTime = DateTime(
                                          _model.availableDate!.year,
                                          _model.availableDate!.month,
                                          _model.availableDate!.day,
                                          startTimeItem.time!.hour,
                                          startTimeItem.time!.minute,
                                        );
                                        if (!slotDateTime.isAfter(now)) {
                                          isInvalid = true;
                                        }
                                      }

                                      if (isInvalid) {
                                        return FlutterFlowTheme.of(context)
                                            .greyDriver;
                                      } else if (_model.availableTime ==
                                          startTimeItem) {
                                        return FlutterFlowTheme.of(context)
                                            .accent1;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryBackground;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: _model.availableTime ==
                                              startTimeItem
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .transparent,
                                      width:
                                          _model.availableTime == startTimeItem
                                              ? 1.0
                                              : 0.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 14.0, 15.0, 14.0),
                                    child: Text(
                                      dateTimeFormat(
                                        "jm",
                                        startTimeItem.time!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: () {
                                              final now = DateTime.now();
                                              final todayAtMidnight = DateTime(now.year, now.month, now.day);
                                              
                                              bool isInvalid = startTimeItem.bokedDates.contains(_model.availableDate);
                                              
                                              if (!isInvalid && _model.availableDate != null && 
                                                  _model.availableDate!.isAtSameMomentAs(todayAtMidnight)) {
                                                final slotDateTime = DateTime(
                                                  _model.availableDate!.year,
                                                  _model.availableDate!.month,
                                                  _model.availableDate!.day,
                                                  startTimeItem.time!.hour,
                                                  startTimeItem.time!.minute,
                                                );
                                                if (!slotDateTime.isAfter(now)) {
                                                  isInvalid = true;
                                                }
                                              }
                                              
                                              return isInvalid
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText;
                                            }(),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: FlutterFlowTheme.of(context).shadow,
                    offset: Offset(
                      0.0,
                      -4.0,
                    ),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          // Set app state values
                          FFAppState().selectedService =
                              widget.serviceDoc?.reference;
                          FFAppState().workingHours = _model.workingHours!;
                          FFAppState().bookingStartDate = functions.bookingTime(
                              _model.availableDate!,
                              _model.availableTime!.time!);
                          FFAppState().availableTime = _model.availableTime!;
                          FFAppState().newAvailableTime = AvailableTimeStruct(
                            time: _model.availableTime?.time,
                            bokedDates: functions.datesList(
                                _model.availableTime!.bokedDates.toList(),
                                _model.availableDate!),
                          );
                          
                          final totalPrice = FFAppState().serviceTotalPrice * (_model.workingHours!);
                          final bookingNumber = random_util.randomInteger(100000, 999999);
                          
                          // Create booking request with pending status
                          // Use the selected booking date/time for booking_date (critical for tab filtering)
                          await MyBookingsRecord.createDoc(
                            currentUserReference!,
                          ).set({
                            ...createMyBookingsRecordData(
                              service: widget.serviceDoc?.reference,
                              user: currentUserReference,
                              bookingDate: FFAppState().bookingStartDate, // Use selected date/time, not current timestamp
                              completed: false,
                              totalPaid: totalPrice,
                              reviewed: false,
                              bookingNumber: bookingNumber,
                              startTime: FFAppState().bookingStartDate,
                              pricePerHour: widget.serviceDoc?.pricePerHour,
                              discount: 1.0,
                              phoneNumber: currentPhoneNumber,
                              workingHours: FFAppState().workingHours,
                            ),
                            ...mapToFirestore({
                              'offerings': FFAppState().selectedOfferings.map((e) => getServiceOfferingsFirestoreData(e, true)).toList(),
                              'status': 'pending_approval',
                            }),
                          });
                          
                          // Send notification to provider
                          if (widget.serviceDoc?.provider != null) {
                            await NotificationsRecord.createDoc(
                              widget.serviceDoc!.provider!,
                            ).set(createNotificationsRecordData(
                              title: 'New Booking Request',
                              description: 'You have a new booking request from ${currentUserDisplayName}.',
                              type: 'booking_request',
                              timeStamp: getCurrentTimestamp,
                              read: false,
                            ));
                          }
                          
                          // Show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Booking request sent! Waiting for provider confirmation.'),
                              backgroundColor: FlutterFlowTheme.of(context).success,
                              duration: Duration(seconds: 3),
                            ),
                          );
                          
                          // Navigate to bookings page
                          context.goNamed(MyBookingsWidget.routeName);
                          
                          safeSetState(() {});
                        },
                        text: 'Send Request',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                      ).animateOnPageLoad(
                          animationsMap['buttonOnPageLoadAnimation']!),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
