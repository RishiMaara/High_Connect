import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'z_booking_payment_card_model.dart';
export 'z_booking_payment_card_model.dart';

class ZBookingPaymentCardWidget extends StatefulWidget {
  const ZBookingPaymentCardWidget({
    super.key,
    required this.paymentDoc,
  });

  final PaymentMethodsRecord? paymentDoc;

  @override
  State<ZBookingPaymentCardWidget> createState() =>
      _ZBookingPaymentCardWidgetState();
}

class _ZBookingPaymentCardWidgetState extends State<ZBookingPaymentCardWidget> {
  late ZBookingPaymentCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZBookingPaymentCardModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        FFAppState().PaymentMethod = widget.paymentDoc?.reference;
        FFAppState().update(() {});
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  if (widget.paymentDoc?.name == 'Visa') {
                    return Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/visa.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  } else if (widget.paymentDoc?.name == 'Mastercard') {
                    return Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDEACE),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/mastercard.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  } else if (widget.paymentDoc?.name == 'Paypal') {
                    return Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFD8DDF3),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/paypal.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  } else if (widget.paymentDoc?.name == 'Google Pay') {
                    return Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE4E5E7),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/google_pay.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  } else if (widget.paymentDoc?.name == 'Apple Pay') {
                    return Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/apple_pay.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  } else if (widget.paymentDoc?.name == 'Discover') {
                    return Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFECDF),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        child: Image.asset(
                          'assets/images/discover.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFD3DEF7),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/american_express.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.paymentDoc?.cardNickname != null &&
                                  widget.paymentDoc?.cardNickname != ''
                              ? widget.paymentDoc?.cardNickname
                              : valueOrDefault<String>(
                                  widget.paymentDoc?.name,
                                  'null',
                                ),
                          'null',
                        ),
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions.hiddenText(
                                widget.paymentDoc?.cardNumber, 2, 2),
                            'null',
                          ),
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
                                    lineHeight: 1.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (FFAppState().PaymentMethod ==
                      widget.paymentDoc?.reference) {
                    return Icon(
                      Icons.radio_button_checked,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    );
                  } else {
                    return Icon(
                      Icons.radio_button_off,
                      color: FlutterFlowTheme.of(context).icons,
                      size: 24.0,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
