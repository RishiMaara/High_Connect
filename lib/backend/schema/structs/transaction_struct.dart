// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TransactionStruct extends FFFirebaseStruct {
  TransactionStruct({
    String? transactionNumber,
    DateTime? transactionDate,
    double? amount,
    double? commission,
    String? recipient,
    String? recipientCard,
    String? sender,
    String? senderCard,
    String? cardName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _transactionNumber = transactionNumber,
        _transactionDate = transactionDate,
        _amount = amount,
        _commission = commission,
        _recipient = recipient,
        _recipientCard = recipientCard,
        _sender = sender,
        _senderCard = senderCard,
        _cardName = cardName,
        super(firestoreUtilData);

  // "transaction_number" field.
  String? _transactionNumber;
  String get transactionNumber => _transactionNumber ?? '';
  set transactionNumber(String? val) => _transactionNumber = val;

  bool hasTransactionNumber() => _transactionNumber != null;

  // "transaction_date" field.
  DateTime? _transactionDate;
  DateTime? get transactionDate => _transactionDate;
  set transactionDate(DateTime? val) => _transactionDate = val;

  bool hasTransactionDate() => _transactionDate != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "commission" field.
  double? _commission;
  double get commission => _commission ?? 0.0;
  set commission(double? val) => _commission = val;

  void incrementCommission(double amount) => commission = commission + amount;

  bool hasCommission() => _commission != null;

  // "recipient" field.
  String? _recipient;
  String get recipient => _recipient ?? '';
  set recipient(String? val) => _recipient = val;

  bool hasRecipient() => _recipient != null;

  // "recipient_card" field.
  String? _recipientCard;
  String get recipientCard => _recipientCard ?? '';
  set recipientCard(String? val) => _recipientCard = val;

  bool hasRecipientCard() => _recipientCard != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  set sender(String? val) => _sender = val;

  bool hasSender() => _sender != null;

  // "sender_card" field.
  String? _senderCard;
  String get senderCard => _senderCard ?? '';
  set senderCard(String? val) => _senderCard = val;

  bool hasSenderCard() => _senderCard != null;

  // "card_name" field.
  String? _cardName;
  String get cardName => _cardName ?? '';
  set cardName(String? val) => _cardName = val;

  bool hasCardName() => _cardName != null;

  static TransactionStruct fromMap(Map<String, dynamic> data) =>
      TransactionStruct(
        transactionNumber: data['transaction_number'] as String?,
        transactionDate: data['transaction_date'] as DateTime?,
        amount: castToType<double>(data['amount']),
        commission: castToType<double>(data['commission']),
        recipient: data['recipient'] as String?,
        recipientCard: data['recipient_card'] as String?,
        sender: data['sender'] as String?,
        senderCard: data['sender_card'] as String?,
        cardName: data['card_name'] as String?,
      );

  static TransactionStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'transaction_number': _transactionNumber,
        'transaction_date': _transactionDate,
        'amount': _amount,
        'commission': _commission,
        'recipient': _recipient,
        'recipient_card': _recipientCard,
        'sender': _sender,
        'sender_card': _senderCard,
        'card_name': _cardName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'transaction_number': serializeParam(
          _transactionNumber,
          ParamType.String,
        ),
        'transaction_date': serializeParam(
          _transactionDate,
          ParamType.DateTime,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'commission': serializeParam(
          _commission,
          ParamType.double,
        ),
        'recipient': serializeParam(
          _recipient,
          ParamType.String,
        ),
        'recipient_card': serializeParam(
          _recipientCard,
          ParamType.String,
        ),
        'sender': serializeParam(
          _sender,
          ParamType.String,
        ),
        'sender_card': serializeParam(
          _senderCard,
          ParamType.String,
        ),
        'card_name': serializeParam(
          _cardName,
          ParamType.String,
        ),
      }.withoutNulls;

  static TransactionStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransactionStruct(
        transactionNumber: deserializeParam(
          data['transaction_number'],
          ParamType.String,
          false,
        ),
        transactionDate: deserializeParam(
          data['transaction_date'],
          ParamType.DateTime,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        commission: deserializeParam(
          data['commission'],
          ParamType.double,
          false,
        ),
        recipient: deserializeParam(
          data['recipient'],
          ParamType.String,
          false,
        ),
        recipientCard: deserializeParam(
          data['recipient_card'],
          ParamType.String,
          false,
        ),
        sender: deserializeParam(
          data['sender'],
          ParamType.String,
          false,
        ),
        senderCard: deserializeParam(
          data['sender_card'],
          ParamType.String,
          false,
        ),
        cardName: deserializeParam(
          data['card_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TransactionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionStruct &&
        transactionNumber == other.transactionNumber &&
        transactionDate == other.transactionDate &&
        amount == other.amount &&
        commission == other.commission &&
        recipient == other.recipient &&
        recipientCard == other.recipientCard &&
        sender == other.sender &&
        senderCard == other.senderCard &&
        cardName == other.cardName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        transactionNumber,
        transactionDate,
        amount,
        commission,
        recipient,
        recipientCard,
        sender,
        senderCard,
        cardName
      ]);
}

TransactionStruct createTransactionStruct({
  String? transactionNumber,
  DateTime? transactionDate,
  double? amount,
  double? commission,
  String? recipient,
  String? recipientCard,
  String? sender,
  String? senderCard,
  String? cardName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransactionStruct(
      transactionNumber: transactionNumber,
      transactionDate: transactionDate,
      amount: amount,
      commission: commission,
      recipient: recipient,
      recipientCard: recipientCard,
      sender: sender,
      senderCard: senderCard,
      cardName: cardName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransactionStruct? updateTransactionStruct(
  TransactionStruct? transaction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transaction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransactionStructData(
  Map<String, dynamic> firestoreData,
  TransactionStruct? transaction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transaction == null) {
    return;
  }
  if (transaction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transaction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transactionData =
      getTransactionFirestoreData(transaction, forFieldValue);
  final nestedData =
      transactionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = transaction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransactionFirestoreData(
  TransactionStruct? transaction, [
  bool forFieldValue = false,
]) {
  if (transaction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transaction.toMap());

  // Add any Firestore field values
  transaction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransactionListFirestoreData(
  List<TransactionStruct>? transactions,
) =>
    transactions?.map((e) => getTransactionFirestoreData(e, true)).toList() ??
    [];
