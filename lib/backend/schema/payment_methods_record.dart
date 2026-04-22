import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentMethodsRecord extends FirestoreRecord {
  PaymentMethodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "card_number" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  bool hasCardNumber() => _cardNumber != null;

  // "card_holder" field.
  String? _cardHolder;
  String get cardHolder => _cardHolder ?? '';
  bool hasCardHolder() => _cardHolder != null;

  // "expire_date" field.
  String? _expireDate;
  String get expireDate => _expireDate ?? '';
  bool hasExpireDate() => _expireDate != null;

  // "cvc" field.
  int? _cvc;
  int get cvc => _cvc ?? 0;
  bool hasCvc() => _cvc != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "card_nickname" field.
  String? _cardNickname;
  String get cardNickname => _cardNickname ?? '';
  bool hasCardNickname() => _cardNickname != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _cardNumber = snapshotData['card_number'] as String?;
    _cardHolder = snapshotData['card_holder'] as String?;
    _expireDate = snapshotData['expire_date'] as String?;
    _cvc = castToType<int>(snapshotData['cvc']);
    _name = snapshotData['name'] as String?;
    _cardNickname = snapshotData['card_nickname'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('payment_methods')
          : FirebaseFirestore.instance.collectionGroup('payment_methods');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('payment_methods').doc(id);

  static Stream<PaymentMethodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentMethodsRecord.fromSnapshot(s));

  static Future<PaymentMethodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentMethodsRecord.fromSnapshot(s));

  static PaymentMethodsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentMethodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentMethodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentMethodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentMethodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentMethodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentMethodsRecordData({
  String? cardNumber,
  String? cardHolder,
  String? expireDate,
  int? cvc,
  String? name,
  String? cardNickname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'card_number': cardNumber,
      'card_holder': cardHolder,
      'expire_date': expireDate,
      'cvc': cvc,
      'name': name,
      'card_nickname': cardNickname,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentMethodsRecordDocumentEquality
    implements Equality<PaymentMethodsRecord> {
  const PaymentMethodsRecordDocumentEquality();

  @override
  bool equals(PaymentMethodsRecord? e1, PaymentMethodsRecord? e2) {
    return e1?.cardNumber == e2?.cardNumber &&
        e1?.cardHolder == e2?.cardHolder &&
        e1?.expireDate == e2?.expireDate &&
        e1?.cvc == e2?.cvc &&
        e1?.name == e2?.name &&
        e1?.cardNickname == e2?.cardNickname;
  }

  @override
  int hash(PaymentMethodsRecord? e) => const ListEquality().hash([
        e?.cardNumber,
        e?.cardHolder,
        e?.expireDate,
        e?.cvc,
        e?.name,
        e?.cardNickname
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentMethodsRecord;
}
