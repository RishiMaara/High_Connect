import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'terms_and_conditions_widget.dart' show TermsAndConditionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';

class TermsAndConditionsModel
    extends FlutterFlowModel<TermsAndConditionsWidget> {
  final CFPaymentGatewayService cfPaymentGatewayService = CFPaymentGatewayService();
  bool isProcessingPayment = false;
  ///  Local state fields for this page.

  bool read = false;

  bool empty = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ServicesRecord? newSevice;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
