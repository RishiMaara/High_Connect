// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    int? type,
    String? address,
    String? addressLine,
    String? cityTown,
    String? country,
    LatLng? geopoint,
    String? zipCode,
    int? serviceRadius,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _address = address,
        _addressLine = addressLine,
        _cityTown = cityTown,
        _country = country,
        _geopoint = geopoint,
        _zipCode = zipCode,
        _serviceRadius = serviceRadius,
        super(firestoreUtilData);

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "address_line" field.
  String? _addressLine;
  String get addressLine => _addressLine ?? '';
  set addressLine(String? val) => _addressLine = val;

  bool hasAddressLine() => _addressLine != null;

  // "city_town" field.
  String? _cityTown;
  String get cityTown => _cityTown ?? '';
  set cityTown(String? val) => _cityTown = val;

  bool hasCityTown() => _cityTown != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "geopoint" field.
  LatLng? _geopoint;
  LatLng? get geopoint => _geopoint;
  set geopoint(LatLng? val) => _geopoint = val;

  bool hasGeopoint() => _geopoint != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;

  bool hasZipCode() => _zipCode != null;

  // "service_radius" field.
  int? _serviceRadius;
  int get serviceRadius => _serviceRadius ?? 0;
  set serviceRadius(int? val) => _serviceRadius = val;

  void incrementServiceRadius(int amount) =>
      serviceRadius = serviceRadius + amount;

  bool hasServiceRadius() => _serviceRadius != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        type: castToType<int>(data['type']),
        address: data['address'] as String?,
        addressLine: data['address_line'] as String?,
        cityTown: data['city_town'] as String?,
        country: data['country'] as String?,
        geopoint: data['geopoint'] as LatLng?,
        zipCode: data['zip_code'] as String?,
        serviceRadius: castToType<int>(data['service_radius']),
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'address': _address,
        'address_line': _addressLine,
        'city_town': _cityTown,
        'country': _country,
        'geopoint': _geopoint,
        'zip_code': _zipCode,
        'service_radius': _serviceRadius,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'address_line': serializeParam(
          _addressLine,
          ParamType.String,
        ),
        'city_town': serializeParam(
          _cityTown,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'geopoint': serializeParam(
          _geopoint,
          ParamType.LatLng,
        ),
        'zip_code': serializeParam(
          _zipCode,
          ParamType.String,
        ),
        'service_radius': serializeParam(
          _serviceRadius,
          ParamType.int,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        addressLine: deserializeParam(
          data['address_line'],
          ParamType.String,
          false,
        ),
        cityTown: deserializeParam(
          data['city_town'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        geopoint: deserializeParam(
          data['geopoint'],
          ParamType.LatLng,
          false,
        ),
        zipCode: deserializeParam(
          data['zip_code'],
          ParamType.String,
          false,
        ),
        serviceRadius: deserializeParam(
          data['service_radius'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        type == other.type &&
        address == other.address &&
        addressLine == other.addressLine &&
        cityTown == other.cityTown &&
        country == other.country &&
        geopoint == other.geopoint &&
        zipCode == other.zipCode &&
        serviceRadius == other.serviceRadius;
  }

  @override
  int get hashCode => const ListEquality().hash([
        type,
        address,
        addressLine,
        cityTown,
        country,
        geopoint,
        zipCode,
        serviceRadius
      ]);
}

AddressStruct createAddressStruct({
  int? type,
  String? address,
  String? addressLine,
  String? cityTown,
  String? country,
  LatLng? geopoint,
  String? zipCode,
  int? serviceRadius,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      type: type,
      address: address,
      addressLine: addressLine,
      cityTown: cityTown,
      country: country,
      geopoint: geopoint,
      zipCode: zipCode,
      serviceRadius: serviceRadius,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? addressStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? addressStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressStruct == null) {
    return;
  }
  if (addressStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressStructData =
      getAddressFirestoreData(addressStruct, forFieldValue);
  final nestedData =
      addressStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? addressStruct, [
  bool forFieldValue = false,
]) {
  if (addressStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressStruct.toMap());

  // Add any Firestore field values
  addressStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addressStructs,
) =>
    addressStructs?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
