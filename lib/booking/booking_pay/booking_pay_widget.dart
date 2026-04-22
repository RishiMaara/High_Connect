import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/booking/components/z_booking_address/z_booking_address_widget.dart';
import '/booking/components/z_booking_payment/z_booking_payment_widget.dart';
import '/booking/components/z_order_information/z_order_information_widget.dart';
import '/booking/components/z_service_details/z_service_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/home/components/z_select_address/z_select_address_widget.dart';
import '/payment_methods/z_add_payment_method/z_add_payment_method_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_util;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_pay_model.dart';
export 'booking_pay_model.dart';

class BookingPayWidget extends StatefulWidget {
  const BookingPayWidget({
    super.key,
    bool? fromAddress,
    required this.serviceDoc,
    this.totalPrice,
  }) : this.fromAddress = fromAddress ?? false;

  final bool fromAddress;
  final ServicesRecord? serviceDoc;
  final double? totalPrice;

  static String routeName = 'BookingPay';
  static String routePath = '/bookingPay';

  @override
  State<BookingPayWidget> createState() => _BookingPayWidgetState();
}

class _BookingPayWidgetState extends State<BookingPayWidget>
    with TickerProviderStateMixin {
  late BookingPayModel _model;

  final animationsMap = <String, AnimationInfo>{};

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingPayModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.fromAddress) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
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
      _model.totalPrice = (widget.totalPrice!) * FFAppState().promoCode;
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
            'Confirm booking',
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.zServiceDetailsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ZServiceDetailsWidget(
                    serviceDoc: widget.serviceDoc!,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.zBookingAddressModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ZBookingAddressWidget(
                    serviceDoc: widget.serviceDoc!,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.zOrderInformationModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ZOrderInformationWidget(
                    serviceDoc: widget.serviceDoc!,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.zBookingPaymentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ZBookingPaymentWidget(
                    serviceDoc: widget.serviceDoc!,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          FFIcons.kcoinsHand,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Advantages',
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
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Guaranteed free cancellation and refunding your funds any time',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                ),
              ),
              Builder(
                builder: (context) {
                  if ((currentUserDocument?.selectedAddress != null) &&
                      (FFAppState().PaymentMethod != null)) {
                    return StreamBuilder<PaymentMethodsRecord>(
                      stream: PaymentMethodsRecord.getDocument(
                          FFAppState().PaymentMethod!),
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

                        final containerPaymentMethodsRecord = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 12.0, 15.0, 0.0),
                            child: StreamBuilder<AddressesRecord>(
                              stream: AddressesRecord.getDocument(
                                  currentUserDocument!.selectedAddress!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 35.0,
                                      height: 35.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final buttonAddressesRecord = snapshot.data!;

                                return FFButtonWidget(
                                  onPressed: () async {
                                    await widget.serviceDoc!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'available_time':
                                              FieldValue.arrayRemove([
                                            getAvailableTimeFirestoreData(
                                              updateAvailableTimeStruct(
                                                FFAppState().availableTime,
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                        },
                                      ),
                                    });

                                    await widget.serviceDoc!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'available_time':
                                              FieldValue.arrayUnion([
                                            getAvailableTimeFirestoreData(
                                              updateAvailableTimeStruct(
                                                FFAppState().newAvailableTime,
                                                clearUnsetFields: true,
                                              ),
                                              true,
                                            )
                                          ]),
                                          'earnings': FieldValue.increment(
                                              widget.totalPrice!),
                                          'clients': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    if ((widget.serviceDoc?.category ==
                                            'Home Pest Protection') ||
                                        (widget.serviceDoc?.category ==
                                            'Cleaning Services')) {
                                      await MyBookingsRecord.createDoc(
                                              currentUserReference!)
                                          .set({
                                        ...createMyBookingsRecordData(
                                          service:
                                              widget.serviceDoc?.reference,
                                          user: currentUserReference,
                                          bookingDate: getCurrentTimestamp,
                                          completed: false,
                                          totalPaid: (widget.totalPrice!) *
                                              FFAppState().promoCode,
                                          reviewed: false,
                                          bookingNumber: random_util
                                              .randomInteger(100000, 999999),
                                          startTime:
                                              FFAppState().bookingStartDate,
                                          pricePerHour:
                                              widget.serviceDoc?.pricePerHour,
                                          discount: FFAppState().promoCode,
                                          address: updateAddressStruct(
                                            AddressStruct(
                                              type: buttonAddressesRecord.type,
                                              address:
                                                  buttonAddressesRecord.address,
                                              addressLine: buttonAddressesRecord
                                                  .addressLine,
                                              cityTown: buttonAddressesRecord
                                                  .cityTown,
                                              country:
                                                  buttonAddressesRecord.country,
                                              geopoint: buttonAddressesRecord
                                                  .geopoint,
                                              zipCode:
                                                  buttonAddressesRecord.zipCode,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          transaction: updateTransactionStruct(
                                            TransactionStruct(
                                              transactionNumber:
                                                  random_util.randomString(
                                                8,
                                                12,
                                                true,
                                                false,
                                                false,
                                              ),
                                              transactionDate:
                                                  getCurrentTimestamp,
                                              amount: widget.totalPrice,
                                              commission: 0.0,
                                              sender:
                                                  containerPaymentMethodsRecord
                                                      .cardHolder,
                                              senderCard:
                                                  containerPaymentMethodsRecord
                                                      .cardNumber,
                                              cardName:
                                                  containerPaymentMethodsRecord
                                                      .name,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          phoneNumber: currentPhoneNumber,
                                          workingHours:
                                              FFAppState().workingHours,
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
                                          service:
                                              widget.serviceDoc?.reference,
                                          user: currentUserReference,
                                          bookingDate: getCurrentTimestamp,
                                          completed: false,
                                          totalPaid: (widget.totalPrice!) *
                                              FFAppState().promoCode,
                                          reviewed: false,
                                          startTime:
                                              FFAppState().bookingStartDate,
                                          discount: FFAppState().promoCode,
                                          address: updateAddressStruct(
                                            AddressStruct(
                                              type: buttonAddressesRecord.type,
                                              address:
                                                  buttonAddressesRecord.address,
                                              addressLine: buttonAddressesRecord
                                                  .addressLine,
                                              cityTown: buttonAddressesRecord
                                                  .cityTown,
                                              country:
                                                  buttonAddressesRecord.country,
                                              geopoint: buttonAddressesRecord
                                                  .geopoint,
                                              zipCode:
                                                  buttonAddressesRecord.zipCode,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          transaction: updateTransactionStruct(
                                            TransactionStruct(
                                              transactionNumber:
                                                  random_util.randomString(
                                                8,
                                                12,
                                                true,
                                                false,
                                                false,
                                              ),
                                              transactionDate:
                                                  getCurrentTimestamp,
                                              amount: widget.totalPrice,
                                              commission: 0.0,
                                              sender:
                                                  containerPaymentMethodsRecord
                                                      .cardHolder,
                                              senderCard:
                                                  containerPaymentMethodsRecord
                                                      .cardNumber,
                                              cardName:
                                                  containerPaymentMethodsRecord
                                                      .name,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          bookingNumber: random_util
                                              .randomInteger(100000, 999999),
                                          pricePerHour:
                                              widget.serviceDoc?.pricePerHour,
                                          phoneNumber: currentPhoneNumber,
                                          workingHours:
                                              FFAppState().workingHours,
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

                                    context.goNamed(
                                        ProgressBookingWidget.routeName);
                                  },
                                  text:
                                      'Pay - \$${((widget.totalPrice!) * FFAppState().promoCode).toString()}',
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['buttonOnPageLoadAnimation']!);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (currentUserDocument?.selectedAddress != null) {
                            if (!(FFAppState().PaymentMethod != null)) {
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
                                        backPage: 1,
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
                        text:
                            'Pay - ${((widget.totalPrice!) * FFAppState().promoCode).toString()}\$',
                        options: FFButtonOptions(
                          width: double.infinity,
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
                        showLoadingIndicator: false,
                      ).animateOnPageLoad(
                          animationsMap['buttonOnPageLoadAnimation']!),
                    );
                  }
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 32.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'By booking services from Servio you are agree our ',
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
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            context.pushNamed(TermOfServiceWidget.routeName);
                          },
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: 'Privacy policy',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            context.pushNamed(PrivacyPolicyWidget.routeName);
                          },
                      )
                    ],
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
                          lineHeight: 1.5,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
