import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_profile/z_service_offerings/z_service_offerings_widget.dart';
import 'hourly_rates_widget.dart' show HourlyRatesWidget;
import 'package:flutter/material.dart';

class HourlyRatesModel extends FlutterFlowModel<HourlyRatesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HourlyRates widget.
  CategoriesRecord? categoryDoc;
  // Models for zServiceOfferings dynamic component.
  late FlutterFlowDynamicModels<ZServiceOfferingsModel> zServiceOfferingsModels;

  @override
  void initState(BuildContext context) {
    zServiceOfferingsModels =
        FlutterFlowDynamicModels(() => ZServiceOfferingsModel());
  }

  @override
  void dispose() {
    zServiceOfferingsModels.dispose();
  }
}
