// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryStruct extends FFFirebaseStruct {
  CategoryStruct({
    String? category,
    List<String>? offerings,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _offerings = offerings,
        super(firestoreUtilData);

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "offerings" field.
  List<String>? _offerings;
  List<String> get offerings => _offerings ?? const [];
  set offerings(List<String>? val) => _offerings = val;

  void updateOfferings(Function(List<String>) updateFn) {
    updateFn(_offerings ??= []);
  }

  bool hasOfferings() => _offerings != null;

  static CategoryStruct fromMap(Map<String, dynamic> data) => CategoryStruct(
        category: data['category'] as String?,
        offerings: getDataList(data['offerings']),
      );

  static CategoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CategoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'offerings': _offerings,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'offerings': serializeParam(
          _offerings,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        offerings: deserializeParam<String>(
          data['offerings'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CategoryStruct &&
        category == other.category &&
        listEquality.equals(offerings, other.offerings);
  }

  @override
  int get hashCode => const ListEquality().hash([category, offerings]);
}

CategoryStruct createCategoryStruct({
  String? category,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryStruct(
      category: category,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoryStruct? updateCategoryStruct(
  CategoryStruct? categoryStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categoryStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoryStructData(
  Map<String, dynamic> firestoreData,
  CategoryStruct? categoryStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categoryStruct == null) {
    return;
  }
  if (categoryStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categoryStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryStructData =
      getCategoryFirestoreData(categoryStruct, forFieldValue);
  final nestedData =
      categoryStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categoryStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoryFirestoreData(
  CategoryStruct? categoryStruct, [
  bool forFieldValue = false,
]) {
  if (categoryStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categoryStruct.toMap());

  // Add any Firestore field values
  categoryStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryListFirestoreData(
  List<CategoryStruct>? categoryStructs,
) =>
    categoryStructs?.map((e) => getCategoryFirestoreData(e, true)).toList() ??
    [];
