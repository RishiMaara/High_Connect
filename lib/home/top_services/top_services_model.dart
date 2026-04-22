import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_filter_list/z_filter_list_widget.dart';
import '/home/z_services_square_card/z_services_square_card_widget.dart';
import 'top_services_widget.dart' show TopServicesWidget;
import 'package:flutter/material.dart';

class TopServicesModel extends FlutterFlowModel<TopServicesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for zFilterList component.
  late ZFilterListModel zFilterListModel;
  // Models for zServicesSquareCard dynamic component.
  late FlutterFlowDynamicModels<ZServicesSquareCardModel>
      zServicesSquareCardModels1;
  // Models for zServicesSquareCard dynamic component.
  late FlutterFlowDynamicModels<ZServicesSquareCardModel>
      zServicesSquareCardModels2;

  @override
  void initState(BuildContext context) {
    zFilterListModel = createModel(context, () => ZFilterListModel());
    zServicesSquareCardModels1 =
        FlutterFlowDynamicModels(() => ZServicesSquareCardModel());
    zServicesSquareCardModels2 =
        FlutterFlowDynamicModels(() => ZServicesSquareCardModel());
  }

  @override
  void dispose() {
    zFilterListModel.dispose();
    zServicesSquareCardModels1.dispose();
    zServicesSquareCardModels2.dispose();
  }
}
