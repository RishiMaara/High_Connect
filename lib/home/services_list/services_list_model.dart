import '/flutter_flow/flutter_flow_util.dart';
import '/home/z_services_square_card/z_services_square_card_widget.dart';
import 'services_list_widget.dart' show ServicesListWidget;
import 'package:flutter/material.dart';

class ServicesListModel extends FlutterFlowModel<ServicesListWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for zServicesSquareCard dynamic component.
  late FlutterFlowDynamicModels<ZServicesSquareCardModel>
      zServicesSquareCardModels1;
  // Models for zServicesSquareCard dynamic component.
  late FlutterFlowDynamicModels<ZServicesSquareCardModel>
      zServicesSquareCardModels2;

  @override
  void initState(BuildContext context) {
    zServicesSquareCardModels1 =
        FlutterFlowDynamicModels(() => ZServicesSquareCardModel());
    zServicesSquareCardModels2 =
        FlutterFlowDynamicModels(() => ZServicesSquareCardModel());
  }

  @override
  void dispose() {
    zServicesSquareCardModels1.dispose();
    zServicesSquareCardModels2.dispose();
  }
}
