// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailableTimeStruct extends FFFirebaseStruct {
  AvailableTimeStruct({
    DateTime? time,
    List<DateTime>? bokedDates,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _bokedDates = bokedDates,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "bokedDates" field.
  List<DateTime>? _bokedDates;
  List<DateTime> get bokedDates => _bokedDates ?? const [];
  set bokedDates(List<DateTime>? val) => _bokedDates = val;

  void updateBokedDates(Function(List<DateTime>) updateFn) {
    updateFn(_bokedDates ??= []);
  }

  bool hasBokedDates() => _bokedDates != null;

  static AvailableTimeStruct fromMap(Map<String, dynamic> data) =>
      AvailableTimeStruct(
        time: data['time'] as DateTime?,
        bokedDates: getDataList(data['bokedDates']),
      );

  static AvailableTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailableTimeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'bokedDates': _bokedDates,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'bokedDates': serializeParam(
          _bokedDates,
          ParamType.DateTime,
          isList: true,
        ),
      }.withoutNulls;

  static AvailableTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailableTimeStruct(
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        bokedDates: deserializeParam<DateTime>(
          data['bokedDates'],
          ParamType.DateTime,
          true,
        ),
      );

  @override
  String toString() => 'AvailableTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AvailableTimeStruct &&
        time == other.time &&
        listEquality.equals(bokedDates, other.bokedDates);
  }

  @override
  int get hashCode => const ListEquality().hash([time, bokedDates]);
}

AvailableTimeStruct createAvailableTimeStruct({
  DateTime? time,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvailableTimeStruct(
      time: time,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvailableTimeStruct? updateAvailableTimeStruct(
  AvailableTimeStruct? availableTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    availableTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvailableTimeStructData(
  Map<String, dynamic> firestoreData,
  AvailableTimeStruct? availableTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (availableTime == null) {
    return;
  }
  if (availableTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && availableTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final availableTimeData =
      getAvailableTimeFirestoreData(availableTime, forFieldValue);
  final nestedData =
      availableTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = availableTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvailableTimeFirestoreData(
  AvailableTimeStruct? availableTime, [
  bool forFieldValue = false,
]) {
  if (availableTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(availableTime.toMap());

  // Add any Firestore field values
  availableTime.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvailableTimeListFirestoreData(
  List<AvailableTimeStruct>? availableTimes,
) =>
    availableTimes
        ?.map((e) => getAvailableTimeFirestoreData(e, true))
        .toList() ??
    [];
