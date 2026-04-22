// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RoomsStruct extends FFFirebaseStruct {
  RoomsStruct({
    String? room,
    int? quantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _room = room,
        _quantity = quantity,
        super(firestoreUtilData);

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  set room(String? val) => _room = val;

  bool hasRoom() => _room != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  static RoomsStruct fromMap(Map<String, dynamic> data) => RoomsStruct(
        room: data['room'] as String?,
        quantity: castToType<int>(data['quantity']),
      );

  static RoomsStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoomsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'room': _room,
        'quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'room': serializeParam(
          _room,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static RoomsStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoomsStruct(
        room: deserializeParam(
          data['room'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RoomsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoomsStruct &&
        room == other.room &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality().hash([room, quantity]);
}

RoomsStruct createRoomsStruct({
  String? room,
  int? quantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RoomsStruct(
      room: room,
      quantity: quantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RoomsStruct? updateRoomsStruct(
  RoomsStruct? rooms, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rooms
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRoomsStructData(
  Map<String, dynamic> firestoreData,
  RoomsStruct? rooms,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rooms == null) {
    return;
  }
  if (rooms.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rooms.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final roomsData = getRoomsFirestoreData(rooms, forFieldValue);
  final nestedData = roomsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = rooms.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRoomsFirestoreData(
  RoomsStruct? rooms, [
  bool forFieldValue = false,
]) {
  if (rooms == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rooms.toMap());

  // Add any Firestore field values
  rooms.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRoomsListFirestoreData(
  List<RoomsStruct>? roomss,
) =>
    roomss?.map((e) => getRoomsFirestoreData(e, true)).toList() ?? [];
