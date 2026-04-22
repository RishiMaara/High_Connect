import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'submitted_widget.dart' show SubmittedWidget;
import 'package:flutter/material.dart';

class SubmittedModel extends FlutterFlowModel<SubmittedWidget> {
  ///  Local state fields for this page.

  List<int> paymentSetup = [0];
  void addToPaymentSetup(int item) => paymentSetup.add(item);
  void removeFromPaymentSetup(int item) => paymentSetup.remove(item);
  void removeAtIndexFromPaymentSetup(int index) => paymentSetup.removeAt(index);
  void insertAtIndexInPaymentSetup(int index, int item) =>
      paymentSetup.insert(index, item);
  void updatePaymentSetupAtIndex(int index, Function(int) updateFn) =>
      paymentSetup[index] = updateFn(paymentSetup[index]);

  List<int> payments = [0, 1];
  void addToPayments(int item) => payments.add(item);
  void removeFromPayments(int item) => payments.remove(item);
  void removeAtIndexFromPayments(int index) => payments.removeAt(index);
  void insertAtIndexInPayments(int index, int item) =>
      payments.insert(index, item);
  void updatePaymentsAtIndex(int index, Function(int) updateFn) =>
      payments[index] = updateFn(payments[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
