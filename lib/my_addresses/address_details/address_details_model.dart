import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'address_details_widget.dart' show AddressDetailsWidget;
import 'package:flutter/material.dart';

class AddressDetailsModel extends FlutterFlowModel<AddressDetailsWidget> {
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
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AddressesRecord? addresssDoc;

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
