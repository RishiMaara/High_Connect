import '/booking/components/z_booking_payment_card/z_booking_payment_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'z_booking_payment_widget.dart' show ZBookingPaymentWidget;
import 'package:flutter/material.dart';

class ZBookingPaymentModel extends FlutterFlowModel<ZBookingPaymentWidget> {
  ///  Local state fields for this component.

  bool promo = false;

  String? errorText;

  bool confirmedPromo = false;

  ///  State fields for stateful widgets in this component.

  // Models for zBookingPaymentCard dynamic component.
  late FlutterFlowDynamicModels<ZBookingPaymentCardModel>
      zBookingPaymentCardModels;
  // State field(s) for Voucher widget.
  FocusNode? voucherFocusNode;
  TextEditingController? voucherTextController;
  String? Function(BuildContext, String?)? voucherTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? bookings;

  @override
  void initState(BuildContext context) {
    zBookingPaymentCardModels =
        FlutterFlowDynamicModels(() => ZBookingPaymentCardModel());
  }

  @override
  void dispose() {
    zBookingPaymentCardModels.dispose();
    voucherFocusNode?.dispose();
    voucherTextController?.dispose();
  }
}
