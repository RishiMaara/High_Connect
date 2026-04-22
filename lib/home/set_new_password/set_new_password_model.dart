import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'set_new_password_widget.dart' show SetNewPasswordWidget;
import 'package:flutter/material.dart';

class SetNewPasswordModel extends FlutterFlowModel<SetNewPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Password widget.
  FocusNode? passwordFocusNode1;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode2;
  TextEditingController? passwordTextController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordTextController2Validator;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    passwordFocusNode1?.dispose();
    passwordTextController1?.dispose();

    passwordFocusNode2?.dispose();
    passwordTextController2?.dispose();
  }
}
