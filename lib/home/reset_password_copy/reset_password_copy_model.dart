import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_copy_widget.dart' show ResetPasswordCopyWidget;
import 'package:flutter/material.dart';

class ResetPasswordCopyModel extends FlutterFlowModel<ResetPasswordCopyWidget> {
  ///  Local state fields for this page.

  String otpCode = '';

  ///  State fields for stateful widgets in this page.

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

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
