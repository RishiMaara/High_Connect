import '/flutter_flow/flutter_flow_util.dart';
import '/payment_methods/z_payment_methods_card/z_payment_methods_card_widget.dart';
import 'my_payment_methods_widget.dart' show MyPaymentMethodsWidget;
import 'package:flutter/material.dart';

class MyPaymentMethodsModel extends FlutterFlowModel<MyPaymentMethodsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for zPaymentMethodsCard dynamic component.
  late FlutterFlowDynamicModels<ZPaymentMethodsCardModel>
      zPaymentMethodsCardModels;

  @override
  void initState(BuildContext context) {
    zPaymentMethodsCardModels =
        FlutterFlowDynamicModels(() => ZPaymentMethodsCardModel());
  }

  @override
  void dispose() {
    zPaymentMethodsCardModels.dispose();
  }
}
