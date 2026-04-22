import '/booking/components/z_bookings_card/z_bookings_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import 'service_bookings_widget.dart' show ServiceBookingsWidget;
import 'package:flutter/material.dart';

class ServiceBookingsModel extends FlutterFlowModel<ServiceBookingsWidget> {
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
  // Models for zBookingsCard dynamic component.
  late FlutterFlowDynamicModels<ZBookingsCardModel> zBookingsCardModels1;
  // Models for zBookingsCard dynamic component.
  late FlutterFlowDynamicModels<ZBookingsCardModel> zBookingsCardModels2;
  // Models for zBookingsCard dynamic component.
  late FlutterFlowDynamicModels<ZBookingsCardModel> zBookingsCardModels3;
  // Model for zNawbar component.
  late ZNawbarModel zNawbarModel;

  @override
  void initState(BuildContext context) {
    zBookingsCardModels1 = FlutterFlowDynamicModels(() => ZBookingsCardModel());
    zBookingsCardModels2 = FlutterFlowDynamicModels(() => ZBookingsCardModel());
    zBookingsCardModels3 = FlutterFlowDynamicModels(() => ZBookingsCardModel());
    zNawbarModel = createModel(context, () => ZNawbarModel());
  }

  @override
  void dispose() {
    zBookingsCardModels1.dispose();
    zBookingsCardModels2.dispose();
    zBookingsCardModels3.dispose();
    zNawbarModel.dispose();
  }
}
