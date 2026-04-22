import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_services_full_width/z_services_full_width_widget.dart';
import '/index.dart';
import 'favorites_widget.dart' show FavoritesWidget;
import 'package:flutter/material.dart';

class FavoritesModel extends FlutterFlowModel<FavoritesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for zServicesFullWidth dynamic component.
  late FlutterFlowDynamicModels<ZServicesFullWidthModel>
      zServicesFullWidthModels;

  @override
  void initState(BuildContext context) {
    zServicesFullWidthModels =
        FlutterFlowDynamicModels(() => ZServicesFullWidthModel());
  }

  @override
  void dispose() {
    zServicesFullWidthModels.dispose();
  }
}
