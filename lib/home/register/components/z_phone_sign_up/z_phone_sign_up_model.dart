import '/flutter_flow/flutter_flow_util.dart';
import '/home/register/components/z_continue_with/z_continue_with_widget.dart';
import 'z_phone_sign_up_widget.dart' show ZPhoneSignUpWidget;
import 'package:flutter/material.dart';

class ZPhoneSignUpModel extends FlutterFlowModel<ZPhoneSignUpWidget> {
  ///  Local state fields for this component.

  bool checkBox = false;

  bool emptyCheckBox = false;

  /// Loading state for OTP request
  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your phone number';
    }
    // Remove any non-digit characters for validation
    final digitsOnly = val.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.length != 10) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  // Model for zContinueWith component.
  late ZContinueWithModel zContinueWithModel;

  @override
  void initState(BuildContext context) {
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    zContinueWithModel = createModel(context, () => ZContinueWithModel());
  }

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    zContinueWithModel.dispose();
  }
}
