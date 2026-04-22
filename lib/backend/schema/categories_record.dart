import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "item" field.
  int? _item;
  int get item => _item ?? 0;
  bool hasItem() => _item != null;

  // "offerings" field.
  List<String>? _offerings;
  List<String> get offerings => _offerings ?? const [];
  bool hasOfferings() => _offerings != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _image = snapshotData['image'] as String?;
    _item = castToType<int>(snapshotData['item']);
    _offerings = getDataList(snapshotData['offerings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? category,
  String? image,
  int? item,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'image': image,
      'item': item,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        e1?.image == e2?.image &&
        e1?.item == e2?.item &&
        listEquality.equals(e1?.offerings, e2?.offerings);
  }

  @override
  int hash(CategoriesRecord? e) =>
      const ListEquality().hash([e?.category, e?.image, e?.item, e?.offerings]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
