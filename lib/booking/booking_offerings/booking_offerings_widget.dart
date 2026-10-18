import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/booking/components/z_offerings_card/z_offerings_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import '/services/booking_notification_util.dart';
import 'package:provider/provider.dart';
import 'booking_offerings_model.dart';
export 'booking_offerings_model.dart';
import '/flutter_flow/random_data_util.dart' as random_util;
import '/flutter_flow/custom_functions.dart' as functions;
import '/booking/my_bookings/my_bookings_widget.dart';

class BookingOfferingsWidget extends StatefulWidget {
  const BookingOfferingsWidget({
    super.key,
    required this.serviceDoc,
  });

  final ServicesRecord? serviceDoc;

  static String routeName = 'BookingOfferings';
  static String routePath = '/bookingOfferings';

  @override
  State<BookingOfferingsWidget> createState() => _BookingOfferingsWidgetState();
}

class _BookingOfferingsWidgetState extends State<BookingOfferingsWidget> {
  late BookingOfferingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingOfferingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().serviceTotalPrice = 0.0;
      FFAppState().selectedOfferings = [];
      FFAppState().promoCode = 1.0;
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
                        'Select the required services',
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
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final serviceOfferings =
                              widget.serviceDoc?.serviceOfferings.toList() ??
                                  [];

                          if (serviceOfferings.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.only(top: 50.0),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.work_off_outlined,
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      size: 64.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        'No Services Available',
                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'This provider has not added any service offerings yet.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context).labelMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: serviceOfferings.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12.0),
                            itemBuilder: (context, serviceOfferingsIndex) {
                              final serviceOfferingsItem =
                                  serviceOfferings[serviceOfferingsIndex];
                              return wrapWithModel(
                                model: _model.zOfferingsCardModels.getModel(
                                  serviceOfferingsIndex.toString(),
                                  serviceOfferingsIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ZOfferingsCardWidget(
                                  key: Key(
                                    'Keyqyy_${serviceOfferingsIndex.toString()}',
                                  ),
                                  offeringsData: serviceOfferingsItem,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 15.0)),
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
                child: FFButtonWidget(
                  onPressed: () async {
                    // Set app state values
                    FFAppState().selectedService =
                        widget.serviceDoc?.reference;
                    FFAppState().bookingStartDate = getCurrentTimestamp;
                    FFAppState().workingHours = 1;
                    
                    final totalPrice = FFAppState().serviceTotalPrice;
                    final bookingNumber = random_util.randomInteger(100000, 999999);
                    
                    // Create booking request with pending status
                    final bookingRef =
                        MyBookingsRecord.createDoc(currentUserReference!);
                    await bookingRef.set({
                      ...createMyBookingsRecordData(
                        service: widget.serviceDoc?.reference,
                        user: currentUserReference,
                        bookingDate: FFAppState().bookingStartDate,
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

                    if (widget.serviceDoc?.provider != null) {
                      await BookingNotificationUtil.notifyProviderOfBookingRequest(
                        providerRef: widget.serviceDoc!.provider!,
                        serviceDoc: widget.serviceDoc,
                        bookingWhen: FFAppState().bookingStartDate!,
                        bookingNumber: bookingNumber,
                        bookingDocRef: bookingRef,
                      );
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
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(
                        24.0, 0.0, 24.0, 0.0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context)
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
                  showLoadingIndicator: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
