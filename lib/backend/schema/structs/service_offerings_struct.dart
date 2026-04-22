// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ServiceOfferingsStruct extends FFFirebaseStruct {
  ServiceOfferingsStruct({
    String? title,
    double? pricePerHour,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _pricePerHour = pricePerHour,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "price_per_hour" field.
  double? _pricePerHour;
  double get pricePerHour => _pricePerHour ?? 0.0;
  set pricePerHour(double? val) => _pricePerHour = val;

  void incrementPricePerHour(double amount) =>
      pricePerHour = pricePerHour + amount;

  bool hasPricePerHour() => _pricePerHour != null;

  static ServiceOfferingsStruct fromMap(Map<String, dynamic> data) =>
      ServiceOfferingsStruct(
        title: data['title'] as String?,
        pricePerHour: castToType<double>(data['price_per_hour']),
      );

  static ServiceOfferingsStruct? maybeFromMap(dynamic data) => data is Map
      ? ServiceOfferingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'price_per_hour': _pricePerHour,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'price_per_hour': serializeParam(
          _pricePerHour,
          ParamType.double,
        ),
      }.withoutNulls;

  static ServiceOfferingsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ServiceOfferingsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        pricePerHour: deserializeParam(
          data['price_per_hour'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ServiceOfferingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceOfferingsStruct &&
        title == other.title &&
        pricePerHour == other.pricePerHour;
  }

  @override
  int get hashCode => const ListEquality().hash([title, pricePerHour]);
}

ServiceOfferingsStruct createServiceOfferingsStruct({
  String? title,
  double? pricePerHour,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServiceOfferingsStruct(
      title: title,
      pricePerHour: pricePerHour,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServiceOfferingsStruct? updateServiceOfferingsStruct(
  ServiceOfferingsStruct? serviceOfferings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    serviceOfferings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServiceOfferingsStructData(
  Map<String, dynamic> firestoreData,
  ServiceOfferingsStruct? serviceOfferings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (serviceOfferings == null) {
    return;
  }
  if (serviceOfferings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && serviceOfferings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final serviceOfferingsData =
      getServiceOfferingsFirestoreData(serviceOfferings, forFieldValue);
  final nestedData =
      serviceOfferingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = serviceOfferings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServiceOfferingsFirestoreData(
  ServiceOfferingsStruct? serviceOfferings, [
  bool forFieldValue = false,
]) {
  if (serviceOfferings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(serviceOfferings.toMap());

  // Add any Firestore field values
  serviceOfferings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServiceOfferingsListFirestoreData(
  List<ServiceOfferingsStruct>? serviceOfferingss,
) =>
    serviceOfferingss
        ?.map((e) => getServiceOfferingsFirestoreData(e, true))
        .toList() ??
    [];
