import '/flutter_flow/flutter_flow_util.dart';
import '/my_addresses/z_addresses_card/z_addresses_card_widget.dart';
import '/index.dart';
import 'my_addresses_widget.dart' show MyAddressesWidget;
import 'package:flutter/material.dart';

class MyAddressesModel extends FlutterFlowModel<MyAddressesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for zAddressesCard dynamic component.
  late FlutterFlowDynamicModels<ZAddressesCardModel> zAddressesCardModels;

  @override
  void initState(BuildContext context) {
    zAddressesCardModels =
        FlutterFlowDynamicModels(() => ZAddressesCardModel());
  }

  @override
  void dispose() {
    zAddressesCardModels.dispose();
  }
}
