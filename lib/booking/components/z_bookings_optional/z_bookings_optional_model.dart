import '/booking/components/optionals_buttons/optionals_buttons_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'z_bookings_optional_widget.dart' show ZBookingsOptionalWidget;
import 'package:flutter/material.dart';

class ZBookingsOptionalModel extends FlutterFlowModel<ZBookingsOptionalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for optionalsButtons component.
  late OptionalsButtonsModel optionalsButtonsModel1;
  // Model for optionalsButtons component.
  late OptionalsButtonsModel optionalsButtonsModel2;
  // Model for optionalsButtons component.
  late OptionalsButtonsModel optionalsButtonsModel3;
  // Model for optionalsButtons component.
  late OptionalsButtonsModel optionalsButtonsModel4;

  @override
  void initState(BuildContext context) {
    optionalsButtonsModel1 =
        createModel(context, () => OptionalsButtonsModel());
    optionalsButtonsModel2 =
        createModel(context, () => OptionalsButtonsModel());
    optionalsButtonsModel3 =
        createModel(context, () => OptionalsButtonsModel());
    optionalsButtonsModel4 =
        createModel(context, () => OptionalsButtonsModel());
  }

  @override
  void dispose() {
    optionalsButtonsModel1.dispose();
    optionalsButtonsModel2.dispose();
    optionalsButtonsModel3.dispose();
    optionalsButtonsModel4.dispose();
  }
}
