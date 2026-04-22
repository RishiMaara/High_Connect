import '/flutter_flow/flutter_flow_util.dart';
import 'payment_methods_widget.dart' show PaymentMethodsWidget;
import 'package:flutter/material.dart';

class PaymentMethodsModel extends FlutterFlowModel<PaymentMethodsWidget> {
  ///  Local state fields for this page.

  List<String> payments = ['Bank transfer', 'PayPal'];
  void addToPayments(String item) => payments.add(item);
  void removeFromPayments(String item) => payments.remove(item);
  void removeAtIndexFromPayments(int index) => payments.removeAt(index);
  void insertAtIndexInPayments(int index, String item) =>
      payments.insert(index, item);
  void updatePaymentsAtIndex(int index, Function(String) updateFn) =>
      payments[index] = updateFn(payments[index]);

  String? connected;

  bool? bankTransfer = false;

  bool? paypal = false;

  String? paymentType;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for AccountHolder widget.
  FocusNode? accountHolderFocusNode;
  TextEditingController? accountHolderTextController;
  String? Function(BuildContext, String?)? accountHolderTextControllerValidator;
  String? _accountHolderTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Account holder is required';
    }

    return null;
  }

  // State field(s) for BankCode widget.
  FocusNode? bankCodeFocusNode;
  TextEditingController? bankCodeTextController;
  String? Function(BuildContext, String?)? bankCodeTextControllerValidator;
  String? _bankCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'AAAABBBBCCC is required';
    }

    return null;
  }

  // State field(s) for BranchCode widget.
  FocusNode? branchCodeFocusNode;
  TextEditingController? branchCodeTextController;
  String? Function(BuildContext, String?)? branchCodeTextControllerValidator;
  String? _branchCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '00000 is required';
    }

    return null;
  }

  // State field(s) for Account widget.
  FocusNode? accountFocusNode;
  TextEditingController? accountTextController;
  String? Function(BuildContext, String?)? accountTextControllerValidator;
  String? _accountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '1234567890 is required';
    }

    return null;
  }

  // State field(s) for ConfirmAccount widget.
  FocusNode? confirmAccountFocusNode;
  TextEditingController? confirmAccountTextController;
  String? Function(BuildContext, String?)?
      confirmAccountTextControllerValidator;
  String? _confirmAccountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '1234567890 is required';
    }

    return null;
  }

  // State field(s) for PayPal widget.
  FocusNode? payPalFocusNode;
  TextEditingController? payPalTextController;
  String? Function(BuildContext, String?)? payPalTextControllerValidator;
  String? _payPalTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'PayPal email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    accountHolderTextControllerValidator =
        _accountHolderTextControllerValidator;
    bankCodeTextControllerValidator = _bankCodeTextControllerValidator;
    branchCodeTextControllerValidator = _branchCodeTextControllerValidator;
    accountTextControllerValidator = _accountTextControllerValidator;
    confirmAccountTextControllerValidator =
        _confirmAccountTextControllerValidator;
    payPalTextControllerValidator = _payPalTextControllerValidator;
  }

  @override
  void dispose() {
    accountHolderFocusNode?.dispose();
    accountHolderTextController?.dispose();

    bankCodeFocusNode?.dispose();
    bankCodeTextController?.dispose();

    branchCodeFocusNode?.dispose();
    branchCodeTextController?.dispose();

    accountFocusNode?.dispose();
    accountTextController?.dispose();

    confirmAccountFocusNode?.dispose();
    confirmAccountTextController?.dispose();

    payPalFocusNode?.dispose();
    payPalTextController?.dispose();
  }
}
