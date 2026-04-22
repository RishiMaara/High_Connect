import '/flutter_flow/flutter_flow_util.dart';
import 'sevice_address_widget.dart' show SeviceAddressWidget;
import 'package:flutter/material.dart';

class SeviceAddressModel extends FlutterFlowModel<SeviceAddressWidget> {
  ///  Local state fields for this page.

  int? addressType = 0;

  int? serviceRadius;

  ///  State fields for stateful widgets in this page.

  // State field(s) for AddressLine widget.
  FocusNode? addressLineFocusNode;
  TextEditingController? addressLineTextController;
  String? Function(BuildContext, String?)? addressLineTextControllerValidator;
  // State field(s) for Pin widget.
  FocusNode? pinFocusNode;
  TextEditingController? pinTextController;
  String? Function(BuildContext, String?)? pinTextControllerValidator;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addressLineFocusNode?.dispose();
    addressLineTextController?.dispose();

    pinFocusNode?.dispose();
    pinTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();
  }
}
