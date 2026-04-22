import '/booking/components/optionals_buttons/optionals_buttons_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'z_address_optional_widget.dart' show ZAddressOptionalWidget;
import 'package:flutter/material.dart';

class ZAddressOptionalModel extends FlutterFlowModel<ZAddressOptionalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for optionalsButtons component.
  late OptionalsButtonsModel optionalsButtonsModel1;
  // Model for optionalsButtons component.
  late OptionalsButtonsModel optionalsButtonsModel2;

  @override
  void initState(BuildContext context) {
    optionalsButtonsModel1 =
        createModel(context, () => OptionalsButtonsModel());
    optionalsButtonsModel2 =
        createModel(context, () => OptionalsButtonsModel());
  }

  @override
  void dispose() {
    optionalsButtonsModel1.dispose();
    optionalsButtonsModel2.dispose();
  }
}
