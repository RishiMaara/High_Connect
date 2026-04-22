// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LangDataStruct extends FFFirebaseStruct {
  LangDataStruct({
    String? language,
    String? flag,
    String? langCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _language = language,
        _flag = flag,
        _langCode = langCode,
        super(firestoreUtilData);

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  // "flag" field.
  String? _flag;
  String get flag => _flag ?? '';
  set flag(String? val) => _flag = val;

  bool hasFlag() => _flag != null;

  // "langCode" field.
  String? _langCode;
  String get langCode => _langCode ?? '';
  set langCode(String? val) => _langCode = val;

  bool hasLangCode() => _langCode != null;

  static LangDataStruct fromMap(Map<String, dynamic> data) => LangDataStruct(
        language: data['language'] as String?,
        flag: data['flag'] as String?,
        langCode: data['langCode'] as String?,
      );

  static LangDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? LangDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'language': _language,
        'flag': _flag,
        'langCode': _langCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
        'flag': serializeParam(
          _flag,
          ParamType.String,
        ),
        'langCode': serializeParam(
          _langCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static LangDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LangDataStruct(
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
        flag: deserializeParam(
          data['flag'],
          ParamType.String,
          false,
        ),
        langCode: deserializeParam(
          data['langCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LangDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LangDataStruct &&
        language == other.language &&
        flag == other.flag &&
        langCode == other.langCode;
  }

  @override
  int get hashCode => const ListEquality().hash([language, flag, langCode]);
}

LangDataStruct createLangDataStruct({
  String? language,
  String? flag,
  String? langCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LangDataStruct(
      language: language,
      flag: flag,
      langCode: langCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LangDataStruct? updateLangDataStruct(
  LangDataStruct? langData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    langData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLangDataStructData(
  Map<String, dynamic> firestoreData,
  LangDataStruct? langData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (langData == null) {
    return;
  }
  if (langData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && langData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final langDataData = getLangDataFirestoreData(langData, forFieldValue);
  final nestedData = langDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = langData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLangDataFirestoreData(
  LangDataStruct? langData, [
  bool forFieldValue = false,
]) {
  if (langData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(langData.toMap());

  // Add any Firestore field values
  langData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLangDataListFirestoreData(
  List<LangDataStruct>? langDatas,
) =>
    langDatas?.map((e) => getLangDataFirestoreData(e, true)).toList() ?? [];
