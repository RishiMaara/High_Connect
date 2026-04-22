import '/booking/components/z_booking_address/z_booking_address_widget.dart';
import '/booking/components/z_booking_payment/z_booking_payment_widget.dart';
import '/booking/components/z_order_information/z_order_information_widget.dart';
import '/booking/components/z_service_details/z_service_details_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'booking_pay_widget.dart' show BookingPayWidget;
import 'package:flutter/material.dart';

class BookingPayModel extends FlutterFlowModel<BookingPayWidget> {
  ///  Local state fields for this page.

  double? totalPrice;

  ///  State fields for stateful widgets in this page.

  // Model for zServiceDetails component.
  late ZServiceDetailsModel zServiceDetailsModel;
  // Model for zBookingAddress component.
  late ZBookingAddressModel zBookingAddressModel;
  // Model for zOrderInformation component.
  late ZOrderInformationModel zOrderInformationModel;
  // Model for zBookingPayment component.
  late ZBookingPaymentModel zBookingPaymentModel;

  @override
  void initState(BuildContext context) {
    zServiceDetailsModel = createModel(context, () => ZServiceDetailsModel());
    zBookingAddressModel = createModel(context, () => ZBookingAddressModel());
    zOrderInformationModel =
        createModel(context, () => ZOrderInformationModel());
    zBookingPaymentModel = createModel(context, () => ZBookingPaymentModel());
  }

  @override
  void dispose() {
    zServiceDetailsModel.dispose();
    zBookingAddressModel.dispose();
    zOrderInformationModel.dispose();
    zBookingPaymentModel.dispose();
  }
}
