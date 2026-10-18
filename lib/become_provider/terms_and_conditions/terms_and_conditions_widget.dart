import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import '/services/cashfree_service.dart';
import '/services/cashfree_config.dart';
import 'package:provider/provider.dart';
import 'terms_and_conditions_model.dart';
export 'terms_and_conditions_model.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({
    super.key,
    required this.serviceCategory,
  });

  final String? serviceCategory;

  static String routeName = 'TermsAndConditions';
  static String routePath = '/termsAndConditions';

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  late TermsAndConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsModel());

    _model.cfPaymentGatewayService.setCallback(
      _onPaymentVerify,
      _onPaymentError,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  void _onPaymentVerify(String orderId) async {
    debugPrint('[Cashfree] Payment verified for order: $orderId');
    // Proceed with service creation
    await _submitService();
  }

  void _onPaymentError(CFErrorResponse errorResponse, String orderId) {
    debugPrint('[Cashfree] Payment failed: ${errorResponse.getMessage()}');
    safeSetState(() => _model.isProcessingPayment = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment failed: ${errorResponse.getMessage()}'),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
  }

  Future<void> _submitService() async {
    // Current submission logic moved here
    final servicesRecordReference = ServicesRecord.collection.doc();
    await servicesRecordReference.set({
      ...createServicesRecordData(
        rate: 0.0,
        image: FFAppState().serviceCover,
        recomendations: true,
        address: FFAppState().serviceAddress.address,
        title: FFAppState().serviceHeadline,
        description: FFAppState().serviceDescription,
        category: widget.serviceCategory,
        createdAt: getCurrentTimestamp,
        geopoint: FFAppState().serviceAddress.geopoint,
        pricePerHour: FFAppState().serviceHourlyRate,
        provider: currentUserReference,
        phoneNumber: currentPhoneNumber,
        servicePayment: updateServicePaymentStruct(
          FFAppState().servicePayment,
          clearUnsetFields: false,
          create: true,
        ),
      ),
      ...mapToFirestore(
        {
          'service_offerings': getServiceOfferingsListFirestoreData(
            FFAppState().selectedServiceOfferings,
          ),
          'available_time': getAvailableTimeListFirestoreData(
            FFAppState().serviceAvailableTime,
          ),
          'gallery': FFAppState().servicePortfolio,
          'available_days': FFAppState().serviceAvailableDay,
        },
      ),
    });

    _model.newSevice = ServicesRecord.getDocumentFromData({
      ...createServicesRecordData(
        rate: 0.0,
        image: FFAppState().serviceCover,
        address: FFAppState().serviceAddress.address,
        title: FFAppState().serviceHeadline,
        description: FFAppState().serviceDescription,
        category: widget.serviceCategory,
        createdAt: getCurrentTimestamp,
        geopoint: FFAppState().serviceAddress.geopoint,
        pricePerHour: FFAppState().serviceHourlyRate,
        provider: currentUserReference,
        phoneNumber: currentPhoneNumber,
      ),
    }, servicesRecordReference);

    await ServiceAddressRecord.createDoc(_model.newSevice!.reference)
        .set(createServiceAddressRecordData(
      type: FFAppState().serviceAddress.type,
      address: FFAppState().serviceAddress.address,
      addressLine: FFAppState().serviceAddress.addressLine,
      cityTown: FFAppState().serviceAddress.cityTown,
      country: FFAppState().serviceAddress.country,
      geopoint: FFAppState().serviceAddress.geopoint,
      zipCode: FFAppState().serviceAddress.zipCode,
    ));

    await currentUserReference!.update(createUsersRecordData(
      service: _model.newSevice?.reference,
      inService: true,
    ));

    safeSetState(() => _model.isProcessingPayment = false);
    context.pushNamed(SubmittedWidget.routeName);
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
                context.safePop();
              },
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Terms and conditions agreement',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'By creating a profile and paying the subscription fee on HIGH Connect , you  agree to be bound by these Terms and Conditions. You acknowledge that you have read, understood, and accept all provisions outlined herein.',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Text(
                          '1.Nature of the Platform',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'HIGH Connect operates as a connecting platform only. We provide a digital marketplace that introduces individuals seeking civil engineering services  to qualified Civil Engineers. We are not a party to any agreements or contracts formed between the Engineer and the Client.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          '2.Engineer Responsibilities and Warranties',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'Qualifications: They hold all necessary, valid, and active licenses, certifications, and insurance required by their local and national jurisdictions to practice civil engineering.\n\nProfile Accuracy: All information provided in their HIGH Connect profile, including education, experience, specialties, and portfolio, is accurate, truthful, and not misleading.\n\nProfessional Conduct: They will conduct all communication and business with Clients in a professional and ethical manner, adhering to the code of conduct of their professional engineering body.\n\nLegal Compliance: They are solely responsible for complying with all applicable laws, tax regulations, and building codes related to their work.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          '3. Financial Arrangements - Critical Disclaimer',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'No Financial Intermediation: HIGH Connect is not involved in the financial transactions between the Engineer and the Client. All payment terms, schedules, methods, and amounts are to be negotiated and agreed upon directly between the Engineer and the Client.\n\nEngineer\'s Liability: The Engineer assumes full and sole responsibility for invoicing the Client, collecting payments, and handling any payment disputes, delays, or non-payment. HIGH Connect bears no liability for any financial loss incurred by the Engineer.\n\nPlatform Fee: The Engineer agrees to pay the specified non-refundable profile subscription fee to HIGH Connect for the visibility and lead generation services provided by the Platform. This fee is for the profile listing only and is not a commission on any work secured.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          '4. Limitation of Liability and Indemnification',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          '\"As Is\" Basis: HIGH Connect provides the platform and connections on an \"as is\" and \"as available\" basis. We do not guarantee the quantity or quality of leads, the availability of the Platform, or the character of any Client.\n\nNo Warranty on Projects: HIGH Connect is not responsible for the quality, safety, timeliness, or legality of the projects undertaken by the Engineer. We provide no warranty for the services rendered by the Engineer.\n\nIndemnification: The Engineer agrees to indemnify and hold harmless HIGH Connect, its owners, and employees from any claims, damages, losses, or liabilities (including legal fees) arising from their professional services, their conduct, their breach of these terms, or any dispute with a Client.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          '5. Legal agreement',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'By accepting these Terms and Conditions, you agree to comply with our platform’s policies. Failure to do so may result in restricted access or removal from Servio.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.read) {
                              _model.read = false;
                              safeSetState(() {});
                            } else {
                              _model.read = true;
                              _model.empty = false;
                              safeSetState(() {});
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: _model.read
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .transparent,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(
                                    color: () {
                                      if (_model.empty) {
                                        return FlutterFlowTheme.of(context)
                                            .error;
                                      } else if (_model.read) {
                                        return FlutterFlowTheme.of(context)
                                            .transparent;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .icons;
                                      }
                                    }(),
                                    width: _model.read ? 0.0 : 1.5,
                                  ),
                                ),
                                child: _model.read
                                    ? Icon(
                                        FFIcons.kcheck,
                                        color: FlutterFlowTheme.of(context).info,
                                        size: 18.0,
                                      ).animate().scale(
                                          duration: 180.ms,
                                          curve: Curves.easeOutBack,
                                        )
                                    : null,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'By checking the box below, I, acknowledge that I have read, understood, and unconditionally agree to all the terms and conditions stated above. ',
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
                                          color: _model.empty
                                              ? FlutterFlowTheme.of(context)
                                                  .error
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).animate(
                        target: _model.empty ? 1.0 : 0.0,
                      ).shake(hz: 8, duration: 400.ms, curve: Curves.easeInOut),
                    ]
                        .addToStart(SizedBox(height: 15.0))
                        .addToEnd(SizedBox(height: 15.0))
                        .animate(interval: 50.ms)
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.08, end: 0, duration: 400.ms, curve: Curves.easeOut),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.read) {
                      if (_model.isProcessingPayment) return;

                      safeSetState(() => _model.isProcessingPayment = true);

                      debugPrint('[Cashfree] Initiating payment for ₹$kRegistrationFee');

                      try {
                        final orderData = await CashfreeService.instance.createOrder(
                          customerId: currentUserUid,
                          customerName: currentUserDisplayName,
                          customerEmail: currentUserEmail,
                          customerPhone: currentPhoneNumber,
                          serviceCategory: widget.serviceCategory ?? '',
                        );

                        if (orderData != null) {
                          CashfreeService.instance.doWebCheckout(
                            gatewayService: _model.cfPaymentGatewayService,
                            orderId: orderData['orderId']!,
                            paymentSessionId: orderData['paymentSessionId']!,
                          );
                        } else {
                          safeSetState(() => _model.isProcessingPayment = false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to initiate payment. Please try again.'),
                              backgroundColor: FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }
                      } catch (e) {
                        debugPrint('[Cashfree] Error: $e');
                        safeSetState(() => _model.isProcessingPayment = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('An error occurred. Please try again.'),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }
                    } else {
                      _model.empty = true;
                      safeSetState(() {});
                    }
                  },
                  text: _model.isProcessingPayment ? 'Processing...' : 'Pay and Submit',
                  options: FFButtonOptions(
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ).animate().fadeIn(delay: 300.ms, duration: 400.ms).slideY(begin: 0.25, end: 0, delay: 300.ms, duration: 400.ms, curve: Curves.easeOut),
          ],
        ),
      ),
    );
  }
}
