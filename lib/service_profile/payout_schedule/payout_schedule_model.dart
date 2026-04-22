import '/flutter_flow/flutter_flow_util.dart';
import '/service_profile/components/z_transaction/z_transaction_widget.dart';
import 'payout_schedule_widget.dart' show PayoutScheduleWidget;
import 'package:flutter/material.dart';

class PayoutScheduleModel extends FlutterFlowModel<PayoutScheduleWidget> {
  ///  Local state fields for this page.

  int pageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for zTransaction dynamic component.
  late FlutterFlowDynamicModels<ZTransactionModel> zTransactionModels;

  @override
  void initState(BuildContext context) {
    zTransactionModels = FlutterFlowDynamicModels(() => ZTransactionModel());
  }

  @override
  void dispose() {
    zTransactionModels.dispose();
  }
}
