import '/flutter_flow/flutter_flow_util.dart';
import '/home/register/components/z_email_sign_in/z_email_sign_in_widget.dart';
import '/home/register/components/z_phone_sign_in/z_phone_sign_in_widget.dart';
import 'sigg_in_copy_widget.dart' show SiggInCopyWidget;
import 'package:flutter/material.dart';

class SiggInCopyModel extends FlutterFlowModel<SiggInCopyWidget> {
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
  // Model for zEmailSignIn component.
  late ZEmailSignInModel zEmailSignInModel;
  // Model for zPhoneSignIn component.
  late ZPhoneSignInModel zPhoneSignInModel;

  @override
  void initState(BuildContext context) {
    zEmailSignInModel = createModel(context, () => ZEmailSignInModel());
    zPhoneSignInModel = createModel(context, () => ZPhoneSignInModel());
  }

  @override
  void dispose() {
    zEmailSignInModel.dispose();
    zPhoneSignInModel.dispose();
  }
}
