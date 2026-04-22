import '/booking/components/z_offerings_card/z_offerings_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'booking_offerings_widget.dart' show BookingOfferingsWidget;
import 'package:flutter/material.dart';

class BookingOfferingsModel extends FlutterFlowModel<BookingOfferingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for zOfferingsCard dynamic component.
  late FlutterFlowDynamicModels<ZOfferingsCardModel> zOfferingsCardModels;

  @override
  void initState(BuildContext context) {
    zOfferingsCardModels =
        FlutterFlowDynamicModels(() => ZOfferingsCardModel());
  }

  @override
  void dispose() {
    zOfferingsCardModels.dispose();
  }
}
