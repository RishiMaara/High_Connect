import '/flutter_flow/flutter_flow_util.dart';
import '/home/z_services_horizontal/z_services_horizontal_widget.dart';
import 'z_services_categories_widget.dart' show ZServicesCategoriesWidget;
import 'package:flutter/material.dart';

class ZServicesCategoriesModel
    extends FlutterFlowModel<ZServicesCategoriesWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for zServicesHorizontal dynamic component.
  late FlutterFlowDynamicModels<ZServicesHorizontalModel>
      zServicesHorizontalModels;

  @override
  void initState(BuildContext context) {
    zServicesHorizontalModels =
        FlutterFlowDynamicModels(() => ZServicesHorizontalModel());
  }

  @override
  void dispose() {
    zServicesHorizontalModels.dispose();
  }
}
