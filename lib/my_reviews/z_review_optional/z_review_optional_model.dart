import '/booking/components/optionals_buttons/optionals_buttons_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'z_review_optional_widget.dart' show ZReviewOptionalWidget;
import 'package:flutter/material.dart';

class ZReviewOptionalModel extends FlutterFlowModel<ZReviewOptionalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for optionalsButtons component.
  late OptionalsButtonsModel optionalsButtonsModel;

  @override
  void initState(BuildContext context) {
    optionalsButtonsModel = createModel(context, () => OptionalsButtonsModel());
  }

  @override
  void dispose() {
    optionalsButtonsModel.dispose();
  }
}
