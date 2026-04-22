import '/flutter_flow/flutter_flow_util.dart';
import '/home/register/components/z_continue_with/z_continue_with_widget.dart';
import 'z_email_sign_in_widget.dart' show ZEmailSignInWidget;
import 'package:flutter/material.dart';

class ZEmailSignInModel extends FlutterFlowModel<ZEmailSignInWidget> {
  ///  Local state fields for this component.

  bool checkBox = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid email address.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your password';
    }

    if (val.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  // Model for zContinueWith component.
  late ZContinueWithModel zContinueWithModel;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    zContinueWithModel = createModel(context, () => ZContinueWithModel());
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    zContinueWithModel.dispose();
  }
}
