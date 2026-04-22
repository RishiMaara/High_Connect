import '/flutter_flow/flutter_flow_util.dart';
import '/service_profile/components/z_clients_card/z_clients_card_widget.dart';
import 'service_clients_widget.dart' show ServiceClientsWidget;
import 'package:flutter/material.dart';

class ServiceClientsModel extends FlutterFlowModel<ServiceClientsWidget> {
  ///  Local state fields for this page.

  int pageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Models for zClientsCard dynamic component.
  late FlutterFlowDynamicModels<ZClientsCardModel> zClientsCardModels;

  @override
  void initState(BuildContext context) {
    zClientsCardModels = FlutterFlowDynamicModels(() => ZClientsCardModel());
  }

  @override
  void dispose() {
    zClientsCardModels.dispose();
  }
}
