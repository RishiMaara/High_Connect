import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/components/z_select_address/z_select_address_widget.dart';
import '/payment_methods/z_add_payment_method/z_add_payment_method_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_util;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reschedule_booking_model.dart';
export 'reschedule_booking_model.dart';

class RescheduleBookingWidget extends StatefulWidget {
  const RescheduleBookingWidget({
    super.key,
    required this.bookingDoc,
    required this.serviceDoc,
  });

  final MyBookingsRecord? bookingDoc;
  final ServicesRecord? serviceDoc;

  static String routeName = 'RescheduleBooking';
  static String routePath = '/rescheduleBooking';

  @override
  State<RescheduleBookingWidget> createState() =>
      _RescheduleBookingWidgetState();
}

class _RescheduleBookingWidgetState extends State<RescheduleBookingWidget> {
  late RescheduleBookingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RescheduleBookingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.availableDate = functions
          .customCalendar(getCurrentTimestamp)
          .where((e) =>
              functions.matchingDays(
                  widget.serviceDoc!.availableDays.toList(), e) ==
              true)
          .toList()
          .firstOrNull;
      _model.availableTime = widget.serviceDoc?.availableTime
          .where((e) => e.bokedDates.contains(_model.availableDate))
          .toList()
          .sortedList(keyOf: (e) => e.time!, desc: false)
          .firstOrNull;
      safeSetState(() {});
    });

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
                        'Select the job starts time',
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
                                    if (functions.matchingDays(
                                            widget.serviceDoc!.availableDays
                                                .toList(),
                                            daysItem) ==
                                        true) {
                                      _model.availableDate = daysItem;
                                      safeSetState(() {});
                                      if (_model.availableTime!.bokedDates
                                          .contains(daysItem)) {
                                        _model.availableTime = widget
                                            .serviceDoc?.availableTime
                                            .where((e) => !e.bokedDates
                                                .contains(daysItem))
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
                                        if (functions.matchingDays(
                                                widget
                                                    .serviceDoc!.availableDays
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
                                        width: 1.0,
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
                          final startTime = widget.serviceDoc?.availableTime
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
                                      if (startTimeItem.bokedDates
                                          .contains(_model.availableDate)) {
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
                                      width: 1.0,
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
                                            color: startTimeItem.bokedDates
                                                    .contains(
                                                        _model.availableDate)
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Working hours',
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
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 102.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model.workingHours != 1) {
                                              _model.workingHours =
                                                  _model.workingHours! + -1;
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Icon(
                                              FFIcons.kminus,
                                              color: _model.workingHours == 1
                                                  ? FlutterFlowTheme.of(context)
                                                      .icons
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.workingHours?.toString(),
                                            '1',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model.workingHours != 8) {
                                              _model.workingHours =
                                                  _model.workingHours! + 1;
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Icon(
                                              FFIcons.kplus,
                                              color: _model.workingHours == 8
                                                  ? FlutterFlowTheme.of(context)
                                                      .icons
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                    // Total price section removed
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (currentUserDocument?.selectedAddress != null) {
                            if (FFAppState().PaymentMethod != null) {
                              await widget.bookingDoc!.service!.update({
                                ...mapToFirestore(
                                  {
                                    'available_time': FieldValue.arrayRemove([
                                      getAvailableTimeFirestoreData(
                                        updateAvailableTimeStruct(
                                          _model.availableTime,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });

                              await widget.bookingDoc!.service!.update({
                                ...createServicesRecordData(
                                  earnings: widget.bookingDoc?.totalPaid,
                                ),
                                ...mapToFirestore(
                                  {
                                    'available_time': FieldValue.arrayUnion([
                                      getAvailableTimeFirestoreData(
                                        createAvailableTimeStruct(
                                          time: _model.availableTime?.time,
                                          fieldValues: {
                                            'bokedDates': functions.datesList(
                                                _model.availableTime!.bokedDates
                                                    .toList(),
                                                _model.availableDate!),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                              if (widget.bookingDoc!.rooms.isNotEmpty) {
                                await MyBookingsRecord.createDoc(
                                        currentUserReference!)
                                    .set({
                                  ...createMyBookingsRecordData(
                                    service: widget.serviceDoc?.reference,
                                    user: currentUserReference,
                                    bookingDate: getCurrentTimestamp,
                                    completed: false,
                                    totalPaid: widget.bookingDoc!.totalPaid /
                                        widget.bookingDoc!.workingHours *
                                        (_model.workingHours!),
                                    reviewed: false,
                                    bookingNumber: random_util.randomInteger(
                                        100000, 999999),
                                    startTime: _model.availableDate,
                                    pricePerHour:
                                        widget.bookingDoc?.pricePerHour,
                                    address: updateAddressStruct(
                                      widget.bookingDoc?.address,
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                    transaction: updateTransactionStruct(
                                      widget.bookingDoc?.transaction,
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                    phoneNumber: currentPhoneNumber,
                                    workingHours: _model.workingHours,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'rooms': FFAppState().roomsQuantity,
                                    },
                                  ),
                                });
                              } else {
                                await MyBookingsRecord.createDoc(
                                        currentUserReference!)
                                    .set({
                                  ...createMyBookingsRecordData(
                                    service: widget.serviceDoc?.reference,
                                    user: currentUserReference,
                                    bookingDate: getCurrentTimestamp,
                                    completed: false,
                                    totalPaid: widget.bookingDoc!.totalPaid /
                                        widget.bookingDoc!.workingHours *
                                        (_model.workingHours!),
                                    reviewed: false,
                                    startTime: FFAppState().bookingStartDate,
                                    address: updateAddressStruct(
                                      widget.bookingDoc?.address,
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                    transaction: updateTransactionStruct(
                                      widget.bookingDoc?.transaction,
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                    bookingNumber: random_util.randomInteger(
                                        100000, 999999),
                                    pricePerHour:
                                        widget.bookingDoc?.pricePerHour,
                                    phoneNumber: currentPhoneNumber,
                                    workingHours: _model.workingHours,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'offerings':
                                          getServiceOfferingsListFirestoreData(
                                        FFAppState().selectedOfferings,
                                      ),
                                    },
                                  ),
                                });
                              }

                              context.goNamed(ProgressBookingWidget.routeName);
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ZAddPaymentMethodWidget(
                                        backPage: 2,
                                        serviceDoc: widget.serviceDoc,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ZSelectAddressWidget(
                                      backPage: 2,
                                      serviceDoc: widget.serviceDoc,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                        text: 'Next',
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
                      ),
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
