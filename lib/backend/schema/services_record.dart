import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "recomendations" field.
  bool? _recomendations;
  bool get recomendations => _recomendations ?? false;
  bool hasRecomendations() => _recomendations != null;

  // "geopoint" field.
  LatLng? _geopoint;
  LatLng? get geopoint => _geopoint;
  bool hasGeopoint() => _geopoint != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "service_offerings" field.
  List<ServiceOfferingsStruct>? _serviceOfferings;
  List<ServiceOfferingsStruct> get serviceOfferings =>
      _serviceOfferings ?? const [];
  bool hasServiceOfferings() => _serviceOfferings != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  // "available_time" field.
  List<AvailableTimeStruct>? _availableTime;
  List<AvailableTimeStruct> get availableTime => _availableTime ?? const [];
  bool hasAvailableTime() => _availableTime != null;

  // "gallery" field.
  List<String>? _gallery;
  List<String> get gallery => _gallery ?? const [];
  bool hasGallery() => _gallery != null;

  // "top_service" field.
  bool? _topService;
  bool get topService => _topService ?? false;
  bool hasTopService() => _topService != null;

  // "provider" field.
  DocumentReference? _provider;
  DocumentReference? get provider => _provider;
  bool hasProvider() => _provider != null;

  // "available_days" field.
  List<DateTime>? _availableDays;
  List<DateTime> get availableDays => _availableDays ?? const [];
  bool hasAvailableDays() => _availableDays != null;

  // "clients" field.
  List<DocumentReference>? _clients;
  List<DocumentReference> get clients => _clients ?? const [];
  bool hasClients() => _clients != null;

  // "earnings" field.
  double? _earnings;
  double get earnings => _earnings ?? 0.0;
  bool hasEarnings() => _earnings != null;

  // "payouts" field.
  double? _payouts;
  double get payouts => _payouts ?? 0.0;
  bool hasPayouts() => _payouts != null;

  // "price_per_hour" field.
  double? _pricePerHour;
  double get pricePerHour => _pricePerHour ?? 0.0;
  bool hasPricePerHour() => _pricePerHour != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "service_payment" field.
  ServicePaymentStruct? _servicePayment;
  ServicePaymentStruct get servicePayment =>
      _servicePayment ?? ServicePaymentStruct();
  bool hasServicePayment() => _servicePayment != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _category = snapshotData['category'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _recomendations = snapshotData['recomendations'] as bool?;
    _geopoint = snapshotData['geopoint'] as LatLng?;
    _address = snapshotData['address'] as String?;
    _serviceOfferings = getStructList(
      snapshotData['service_offerings'],
      ServiceOfferingsStruct.fromMap,
    );
    _title = snapshotData['title'] as String?;
    _rate = castToType<double>(snapshotData['rate']);
    _availableTime = getStructList(
      snapshotData['available_time'],
      AvailableTimeStruct.fromMap,
    );
    _gallery = getDataList(snapshotData['gallery']);
    _topService = snapshotData['top_service'] as bool?;
    _provider = snapshotData['provider'] as DocumentReference?;
    _availableDays = getDataList(snapshotData['available_days']);
    _clients = getDataList(snapshotData['clients']);
    _earnings = castToType<double>(snapshotData['earnings']);
    _payouts = castToType<double>(snapshotData['payouts']);
    _pricePerHour = castToType<double>(snapshotData['price_per_hour']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _servicePayment = snapshotData['service_payment'] is ServicePaymentStruct
        ? snapshotData['service_payment']
        : ServicePaymentStruct.maybeFromMap(snapshotData['service_payment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? description,
  String? image,
  String? category,
  DateTime? createdAt,
  bool? recomendations,
  LatLng? geopoint,
  String? address,
  String? title,
  double? rate,
  bool? topService,
  DocumentReference? provider,
  double? earnings,
  double? payouts,
  double? pricePerHour,
  String? phoneNumber,
  ServicePaymentStruct? servicePayment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'image': image,
      'category': category,
      'created_at': createdAt,
      'recomendations': recomendations,
      'geopoint': geopoint,
      'address': address,
      'title': title,
      'rate': rate,
      'top_service': topService,
      'provider': provider,
      'earnings': earnings,
      'payouts': payouts,
      'price_per_hour': pricePerHour,
      'phone_number': phoneNumber,
      'service_payment': ServicePaymentStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "service_payment" field.
  addServicePaymentStructData(firestoreData, servicePayment, 'service_payment');

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.category == e2?.category &&
        e1?.createdAt == e2?.createdAt &&
        e1?.recomendations == e2?.recomendations &&
        e1?.geopoint == e2?.geopoint &&
        e1?.address == e2?.address &&
        listEquality.equals(e1?.serviceOfferings, e2?.serviceOfferings) &&
        e1?.title == e2?.title &&
        e1?.rate == e2?.rate &&
        listEquality.equals(e1?.availableTime, e2?.availableTime) &&
        listEquality.equals(e1?.gallery, e2?.gallery) &&
        e1?.topService == e2?.topService &&
        e1?.provider == e2?.provider &&
        listEquality.equals(e1?.availableDays, e2?.availableDays) &&
        listEquality.equals(e1?.clients, e2?.clients) &&
        e1?.earnings == e2?.earnings &&
        e1?.payouts == e2?.payouts &&
        e1?.pricePerHour == e2?.pricePerHour &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.servicePayment == e2?.servicePayment;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality().hash([
        e?.description,
        e?.image,
        e?.category,
        e?.createdAt,
        e?.recomendations,
        e?.geopoint,
        e?.address,
        e?.serviceOfferings,
        e?.title,
        e?.rate,
        e?.availableTime,
        e?.gallery,
        e?.topService,
        e?.provider,
        e?.availableDays,
        e?.clients,
        e?.earnings,
        e?.payouts,
        e?.pricePerHour,
        e?.phoneNumber,
        e?.servicePayment
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
