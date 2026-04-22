import '/flutter_flow/flutter_flow_util.dart';
import '/home/register/components/z_continue_with/z_continue_with_widget.dart';
import 'z_phone_sign_in_widget.dart' show ZPhoneSignInWidget;
import 'package:flutter/material.dart';

class ZPhoneSignInModel extends FlutterFlowModel<ZPhoneSignInWidget> {
  ///  Local state fields for this component.

  bool checkBox = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // Model for zContinueWith component.
  late ZContinueWithModel zContinueWithModel;

  @override
  void initState(BuildContext context) {
    zContinueWithModel = createModel(context, () => ZContinueWithModel());
  }

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    zContinueWithModel.dispose();
  }
}
