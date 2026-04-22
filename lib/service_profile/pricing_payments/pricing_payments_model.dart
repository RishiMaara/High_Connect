import '/buttons/text_right/text_right_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pricing_payments_widget.dart' show PricingPaymentsWidget;
import 'package:flutter/material.dart';

class PricingPaymentsModel extends FlutterFlowModel<PricingPaymentsWidget> {
  ///  Local state fields for this page.

  int pageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for TextRight component.
  late TextRightModel textRightModel1;
  // Model for TextRight component.
  late TextRightModel textRightModel2;
  // Model for TextRight component.
  late TextRightModel textRightModel3;

  @override
  void initState(BuildContext context) {
    textRightModel1 = createModel(context, () => TextRightModel());
    textRightModel2 = createModel(context, () => TextRightModel());
    textRightModel3 = createModel(context, () => TextRightModel());
  }

  @override
  void dispose() {
    textRightModel1.dispose();
    textRightModel2.dispose();
    textRightModel3.dispose();
  }
}
