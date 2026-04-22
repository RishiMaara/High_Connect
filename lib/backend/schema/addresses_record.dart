import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressesRecord extends FirestoreRecord {
  AddressesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "address_line" field.
  String? _addressLine;
  String get addressLine => _addressLine ?? '';
  bool hasAddressLine() => _addressLine != null;

  // "city_town" field.
  String? _cityTown;
  String get cityTown => _cityTown ?? '';
  bool hasCityTown() => _cityTown != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "geopoint" field.
  LatLng? _geopoint;
  LatLng? get geopoint => _geopoint;
  bool hasGeopoint() => _geopoint != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = castToType<int>(snapshotData['type']);
    _address = snapshotData['address'] as String?;
    _addressLine = snapshotData['address_line'] as String?;
    _cityTown = snapshotData['city_town'] as String?;
    _country = snapshotData['country'] as String?;
    _geopoint = snapshotData['geopoint'] as LatLng?;
    _zipCode = snapshotData['zip_code'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('addresses')
          : FirebaseFirestore.instance.collectionGroup('addresses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('addresses').doc(id);

  static Stream<AddressesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddressesRecord.fromSnapshot(s));

  static Future<AddressesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddressesRecord.fromSnapshot(s));

  static AddressesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddressesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddressesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddressesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddressesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddressesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddressesRecordData({
  int? type,
  String? address,
  String? addressLine,
  String? cityTown,
  String? country,
  LatLng? geopoint,
  String? zipCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'address': address,
      'address_line': addressLine,
      'city_town': cityTown,
      'country': country,
      'geopoint': geopoint,
      'zip_code': zipCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class AddressesRecordDocumentEquality implements Equality<AddressesRecord> {
  const AddressesRecordDocumentEquality();

  @override
  bool equals(AddressesRecord? e1, AddressesRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.address == e2?.address &&
        e1?.addressLine == e2?.addressLine &&
        e1?.cityTown == e2?.cityTown &&
        e1?.country == e2?.country &&
        e1?.geopoint == e2?.geopoint &&
        e1?.zipCode == e2?.zipCode;
  }

  @override
  int hash(AddressesRecord? e) => const ListEquality().hash([
        e?.type,
        e?.address,
        e?.addressLine,
        e?.cityTown,
        e?.country,
        e?.geopoint,
        e?.zipCode
      ]);

  @override
  bool isValidKey(Object? o) => o is AddressesRecord;
}
