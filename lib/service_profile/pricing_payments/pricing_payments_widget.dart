import '/backend/backend.dart';
import '/buttons/text_right/text_right_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pricing_payments_model.dart';
export 'pricing_payments_model.dart';

class PricingPaymentsWidget extends StatefulWidget {
  const PricingPaymentsWidget({
    super.key,
    this.serviceDoc,
  });

  final ServicesRecord? serviceDoc;

  static String routeName = 'PricingPayments';
  static String routePath = '/pricingPayments';

  @override
  State<PricingPaymentsWidget> createState() => _PricingPaymentsWidgetState();
}

class _PricingPaymentsWidgetState extends State<PricingPaymentsWidget> {
  late PricingPaymentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PricingPaymentsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                context.pop();
              },
            ),
          ),
          title: Text(
            'Pricing & Payments',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
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
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  HourlyRatesWidget.routeName,
                  queryParameters: {
                    'serviceDoc': serializeParam(
                      widget.serviceDoc,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'serviceDoc': widget.serviceDoc,
                  },
                );
              },
              child: wrapWithModel(
                model: _model.textRightModel1,
                updateCallback: () => safeSetState(() {}),
                child: TextRightWidget(
                  content: 'Hourly Rates',
                  showDivider: true,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  PaymentMethodsWidget.routeName,
                  queryParameters: {
                    'serviceDoc': serializeParam(
                      widget.serviceDoc,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'serviceDoc': widget.serviceDoc,
                  },
                );
              },
              child: wrapWithModel(
                model: _model.textRightModel2,
                updateCallback: () => safeSetState(() {}),
                child: TextRightWidget(
                  content: 'Payment Methods',
                  showDivider: true,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  PayoutScheduleWidget.routeName,
                  queryParameters: {
                    'serviceDoc': serializeParam(
                      widget.serviceDoc,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'serviceDoc': widget.serviceDoc,
                  },
                );
              },
              child: wrapWithModel(
                model: _model.textRightModel3,
                updateCallback: () => safeSetState(() {}),
                child: TextRightWidget(
                  content: 'Payout Schedule',
                  showDivider: false,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
