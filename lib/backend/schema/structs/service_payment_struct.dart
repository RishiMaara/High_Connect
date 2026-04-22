// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ServicePaymentStruct extends FFFirebaseStruct {
  ServicePaymentStruct({
    String? paymentType,
    String? holder,
    String? bankCode,
    int? branchCode,
    int? account,
    String? paypalEmail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _paymentType = paymentType,
        _holder = holder,
        _bankCode = bankCode,
        _branchCode = branchCode,
        _account = account,
        _paypalEmail = paypalEmail,
        super(firestoreUtilData);

  // "payment_type" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  set paymentType(String? val) => _paymentType = val;

  bool hasPaymentType() => _paymentType != null;

  // "holder" field.
  String? _holder;
  String get holder => _holder ?? '';
  set holder(String? val) => _holder = val;

  bool hasHolder() => _holder != null;

  // "bank_code" field.
  String? _bankCode;
  String get bankCode => _bankCode ?? '';
  set bankCode(String? val) => _bankCode = val;

  bool hasBankCode() => _bankCode != null;

  // "branch_code" field.
  int? _branchCode;
  int get branchCode => _branchCode ?? 0;
  set branchCode(int? val) => _branchCode = val;

  void incrementBranchCode(int amount) => branchCode = branchCode + amount;

  bool hasBranchCode() => _branchCode != null;

  // "account" field.
  int? _account;
  int get account => _account ?? 0;
  set account(int? val) => _account = val;

  void incrementAccount(int amount) => account = account + amount;

  bool hasAccount() => _account != null;

  // "paypal_email" field.
  String? _paypalEmail;
  String get paypalEmail => _paypalEmail ?? '';
  set paypalEmail(String? val) => _paypalEmail = val;

  bool hasPaypalEmail() => _paypalEmail != null;

  static ServicePaymentStruct fromMap(Map<String, dynamic> data) =>
      ServicePaymentStruct(
        paymentType: data['payment_type'] as String?,
        holder: data['holder'] as String?,
        bankCode: data['bank_code'] as String?,
        branchCode: castToType<int>(data['branch_code']),
        account: castToType<int>(data['account']),
        paypalEmail: data['paypal_email'] as String?,
      );

  static ServicePaymentStruct? maybeFromMap(dynamic data) => data is Map
      ? ServicePaymentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'payment_type': _paymentType,
        'holder': _holder,
        'bank_code': _bankCode,
        'branch_code': _branchCode,
        'account': _account,
        'paypal_email': _paypalEmail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'payment_type': serializeParam(
          _paymentType,
          ParamType.String,
        ),
        'holder': serializeParam(
          _holder,
          ParamType.String,
        ),
        'bank_code': serializeParam(
          _bankCode,
          ParamType.String,
        ),
        'branch_code': serializeParam(
          _branchCode,
          ParamType.int,
        ),
        'account': serializeParam(
          _account,
          ParamType.int,
        ),
        'paypal_email': serializeParam(
          _paypalEmail,
          ParamType.String,
        ),
      }.withoutNulls;

  static ServicePaymentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServicePaymentStruct(
        paymentType: deserializeParam(
          data['payment_type'],
          ParamType.String,
          false,
        ),
        holder: deserializeParam(
          data['holder'],
          ParamType.String,
          false,
        ),
        bankCode: deserializeParam(
          data['bank_code'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['branch_code'],
          ParamType.int,
          false,
        ),
        account: deserializeParam(
          data['account'],
          ParamType.int,
          false,
        ),
        paypalEmail: deserializeParam(
          data['paypal_email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ServicePaymentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServicePaymentStruct &&
        paymentType == other.paymentType &&
        holder == other.holder &&
        bankCode == other.bankCode &&
        branchCode == other.branchCode &&
        account == other.account &&
        paypalEmail == other.paypalEmail;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([paymentType, holder, bankCode, branchCode, account, paypalEmail]);
}

ServicePaymentStruct createServicePaymentStruct({
  String? paymentType,
  String? holder,
  String? bankCode,
  int? branchCode,
  int? account,
  String? paypalEmail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServicePaymentStruct(
      paymentType: paymentType,
      holder: holder,
      bankCode: bankCode,
      branchCode: branchCode,
      account: account,
      paypalEmail: paypalEmail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServicePaymentStruct? updateServicePaymentStruct(
  ServicePaymentStruct? servicePayment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    servicePayment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServicePaymentStructData(
  Map<String, dynamic> firestoreData,
  ServicePaymentStruct? servicePayment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (servicePayment == null) {
    return;
  }
  if (servicePayment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && servicePayment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final servicePaymentData =
      getServicePaymentFirestoreData(servicePayment, forFieldValue);
  final nestedData =
      servicePaymentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = servicePayment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServicePaymentFirestoreData(
  ServicePaymentStruct? servicePayment, [
  bool forFieldValue = false,
]) {
  if (servicePayment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(servicePayment.toMap());

  // Add any Firestore field values
  servicePayment.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServicePaymentListFirestoreData(
  List<ServicePaymentStruct>? servicePayments,
) =>
    servicePayments
        ?.map((e) => getServicePaymentFirestoreData(e, true))
        .toList() ??
    [];
