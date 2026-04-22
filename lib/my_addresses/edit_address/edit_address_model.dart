import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_address_widget.dart' show EditAddressWidget;
import 'package:flutter/material.dart';

class EditAddressModel extends FlutterFlowModel<EditAddressWidget> {
  ///  Local state fields for this page.

  int? addressType = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for AddressLine widget.
  FocusNode? addressLineFocusNode;
  TextEditingController? addressLineTextController;
  String? Function(BuildContext, String?)? addressLineTextControllerValidator;
  // State field(s) for ZipCode widget.
  FocusNode? zipCodeFocusNode;
  TextEditingController? zipCodeTextController;
  String? Function(BuildContext, String?)? zipCodeTextControllerValidator;
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

    zipCodeFocusNode?.dispose();
    zipCodeTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();
  }
}
