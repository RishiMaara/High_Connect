import '/booking/components/z_my_bookings_card/z_my_bookings_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import 'my_bookings_widget.dart' show MyBookingsWidget;
import 'package:flutter/material.dart';

class MyBookingsModel extends FlutterFlowModel<MyBookingsWidget> {
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
  // Models for zMyBookingsCard dynamic component.
  late FlutterFlowDynamicModels<ZMyBookingsCardModel> zMyBookingsCardModels1;
  // Models for zMyBookingsCard dynamic component.
  late FlutterFlowDynamicModels<ZMyBookingsCardModel> zMyBookingsCardModels2;
  // Models for zMyBookingsCard dynamic component.
  late FlutterFlowDynamicModels<ZMyBookingsCardModel> zMyBookingsCardModels3;
  // Model for zNawbar component.
  late ZNawbarModel zNawbarModel;

  @override
  void initState(BuildContext context) {
    zMyBookingsCardModels1 =
        FlutterFlowDynamicModels(() => ZMyBookingsCardModel());
    zMyBookingsCardModels2 =
        FlutterFlowDynamicModels(() => ZMyBookingsCardModel());
    zMyBookingsCardModels3 =
        FlutterFlowDynamicModels(() => ZMyBookingsCardModel());
    zNawbarModel = createModel(context, () => ZNawbarModel());
  }

  @override
  void dispose() {
    zMyBookingsCardModels1.dispose();
    zMyBookingsCardModels2.dispose();
    zMyBookingsCardModels3.dispose();
    zNawbarModel.dispose();
  }
}
