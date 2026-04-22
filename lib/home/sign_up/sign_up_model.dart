import '/flutter_flow/flutter_flow_util.dart';
import '/home/register/components/z_email_sign_up/z_email_sign_up_widget.dart';
import '/home/register/components/z_phone_sign_up/z_phone_sign_up_widget.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  int? pageViewItem = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for zEmailSignUp component.
  late ZEmailSignUpModel zEmailSignUpModel;
  // Model for zPhoneSignUp component.
  late ZPhoneSignUpModel zPhoneSignUpModel;

  @override
  void initState(BuildContext context) {
    zEmailSignUpModel = createModel(context, () => ZEmailSignUpModel());
    zPhoneSignUpModel = createModel(context, () => ZPhoneSignUpModel());
  }

  @override
  void dispose() {
    zEmailSignUpModel.dispose();
    zPhoneSignUpModel.dispose();
  }
}
