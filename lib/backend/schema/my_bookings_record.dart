import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyBookingsRecord extends FirestoreRecord {
  MyBookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "service" field.
  DocumentReference? _service;
  DocumentReference? get service => _service;
  bool hasService() => _service != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "booking_date" field.
  DateTime? _bookingDate;
  DateTime? get bookingDate => _bookingDate;
  bool hasBookingDate() => _bookingDate != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "total_paid" field.
  double? _totalPaid;
  double get totalPaid => _totalPaid ?? 0.0;
  bool hasTotalPaid() => _totalPaid != null;

  // "reviewed" field.
  bool? _reviewed;
  bool get reviewed => _reviewed ?? false;
  bool hasReviewed() => _reviewed != null;

  // "rooms" field.
  List<String>? _rooms;
  List<String> get rooms => _rooms ?? const [];
  bool hasRooms() => _rooms != null;

  // "offerings" field.
  List<ServiceOfferingsStruct>? _offerings;
  List<ServiceOfferingsStruct> get offerings => _offerings ?? const [];
  bool hasOfferings() => _offerings != null;

  // "booking_number" field.
  int? _bookingNumber;
  int get bookingNumber => _bookingNumber ?? 0;
  bool hasBookingNumber() => _bookingNumber != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  // "price_per_hour" field.
  double? _pricePerHour;
  double get pricePerHour => _pricePerHour ?? 0.0;
  bool hasPricePerHour() => _pricePerHour != null;

  // "transaction" field.
  TransactionStruct? _transaction;
  TransactionStruct get transaction => _transaction ?? TransactionStruct();
  bool hasTransaction() => _transaction != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "working_hours" field.
  int? _workingHours;
  int get workingHours => _workingHours ?? 0;
  bool hasWorkingHours() => _workingHours != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _service = snapshotData['service'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _bookingDate = snapshotData['booking_date'] as DateTime?;
    _completed = snapshotData['completed'] as bool?;
    _totalPaid = castToType<double>(snapshotData['total_paid']);
    _reviewed = snapshotData['reviewed'] as bool?;
    _rooms = getDataList(snapshotData['rooms']);
    _offerings = getStructList(
      snapshotData['offerings'],
      ServiceOfferingsStruct.fromMap,
    );
    _bookingNumber = castToType<int>(snapshotData['booking_number']);
    _id = snapshotData['id'] as String?;
    _discount = castToType<double>(snapshotData['discount']);
    _startTime = snapshotData['start_time'] as DateTime?;
    _address = snapshotData['address'] is AddressStruct
        ? snapshotData['address']
        : AddressStruct.maybeFromMap(snapshotData['address']);
    _pricePerHour = castToType<double>(snapshotData['price_per_hour']);
    _transaction = snapshotData['transaction'] is TransactionStruct
        ? snapshotData['transaction']
        : TransactionStruct.maybeFromMap(snapshotData['transaction']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _workingHours = castToType<int>(snapshotData['working_hours']);
    _status = snapshotData['status'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_bookings')
          : FirebaseFirestore.instance.collectionGroup('my_bookings');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('my_bookings').doc(id);

  static Stream<MyBookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyBookingsRecord.fromSnapshot(s));

  static Future<MyBookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyBookingsRecord.fromSnapshot(s));

  static MyBookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyBookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyBookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyBookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyBookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyBookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyBookingsRecordData({
  DocumentReference? service,
  DocumentReference? user,
  DateTime? bookingDate,
  bool? completed,
  double? totalPaid,
  bool? reviewed,
  int? bookingNumber,
  String? id,
  double? discount,
  DateTime? startTime,
  AddressStruct? address,
  double? pricePerHour,
  TransactionStruct? transaction,
  String? phoneNumber,

  int? workingHours,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'service': service,
      'user': user,
      'booking_date': bookingDate,
      'completed': completed,
      'total_paid': totalPaid,
      'reviewed': reviewed,
      'booking_number': bookingNumber,
      'id': id,
      'discount': discount,
      'start_time': startTime,
      'address': AddressStruct().toMap(),
      'price_per_hour': pricePerHour,
      'transaction': TransactionStruct().toMap(),
      'phone_number': phoneNumber,
      'working_hours': workingHours,
      'status': status,
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  // Handle nested data for "transaction" field.
  addTransactionStructData(firestoreData, transaction, 'transaction');

  return firestoreData;
}

class MyBookingsRecordDocumentEquality implements Equality<MyBookingsRecord> {
  const MyBookingsRecordDocumentEquality();

  @override
  bool equals(MyBookingsRecord? e1, MyBookingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.service == e2?.service &&
        e1?.user == e2?.user &&
        e1?.bookingDate == e2?.bookingDate &&
        e1?.completed == e2?.completed &&
        e1?.totalPaid == e2?.totalPaid &&
        e1?.reviewed == e2?.reviewed &&
        listEquality.equals(e1?.rooms, e2?.rooms) &&
        listEquality.equals(e1?.offerings, e2?.offerings) &&
        e1?.bookingNumber == e2?.bookingNumber &&
        e1?.id == e2?.id &&
        e1?.discount == e2?.discount &&
        e1?.startTime == e2?.startTime &&
        e1?.address == e2?.address &&
        e1?.pricePerHour == e2?.pricePerHour &&
        e1?.transaction == e2?.transaction &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.workingHours == e2?.workingHours &&
        e1?.status == e2?.status;
  }

  @override
  int hash(MyBookingsRecord? e) => const ListEquality().hash([
        e?.service,
        e?.user,
        e?.bookingDate,
        e?.completed,
        e?.totalPaid,
        e?.reviewed,
        e?.rooms,
        e?.offerings,
        e?.bookingNumber,
        e?.id,
        e?.discount,
        e?.startTime,
        e?.address,
        e?.pricePerHour,
        e?.transaction,
        e?.phoneNumber,
        e?.phoneNumber,
        e?.workingHours,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is MyBookingsRecord;
}
