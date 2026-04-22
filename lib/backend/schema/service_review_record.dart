import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceReviewRecord extends FirestoreRecord {
  ServiceReviewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "review_date" field.
  DateTime? _reviewDate;
  DateTime? get reviewDate => _reviewDate;
  bool hasReviewDate() => _reviewDate != null;

  // "published" field.
  bool? _published;
  bool get published => _published ?? false;
  bool hasPublished() => _published != null;

  // "anonymous" field.
  bool? _anonymous;
  bool get anonymous => _anonymous ?? false;
  bool hasAnonymous() => _anonymous != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_image" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  bool hasUserImage() => _userImage != null;

  // "service_aspects" field.
  List<String>? _serviceAspects;
  List<String> get serviceAspects => _serviceAspects ?? const [];
  bool hasServiceAspects() => _serviceAspects != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rate = castToType<double>(snapshotData['rate']);
    _images = getDataList(snapshotData['images']);
    _reviewDate = snapshotData['review_date'] as DateTime?;
    _published = snapshotData['published'] as bool?;
    _anonymous = snapshotData['anonymous'] as bool?;
    _comment = snapshotData['comment'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _userImage = snapshotData['user_image'] as String?;
    _serviceAspects = getDataList(snapshotData['service_aspects']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('service_review')
          : FirebaseFirestore.instance.collectionGroup('service_review');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('service_review').doc(id);

  static Stream<ServiceReviewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceReviewRecord.fromSnapshot(s));

  static Future<ServiceReviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceReviewRecord.fromSnapshot(s));

  static ServiceReviewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceReviewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceReviewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceReviewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceReviewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceReviewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceReviewRecordData({
  double? rate,
  DateTime? reviewDate,
  bool? published,
  bool? anonymous,
  String? comment,
  String? userName,
  String? userImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rate': rate,
      'review_date': reviewDate,
      'published': published,
      'anonymous': anonymous,
      'comment': comment,
      'user_name': userName,
      'user_image': userImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceReviewRecordDocumentEquality
    implements Equality<ServiceReviewRecord> {
  const ServiceReviewRecordDocumentEquality();

  @override
  bool equals(ServiceReviewRecord? e1, ServiceReviewRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rate == e2?.rate &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.reviewDate == e2?.reviewDate &&
        e1?.published == e2?.published &&
        e1?.anonymous == e2?.anonymous &&
        e1?.comment == e2?.comment &&
        e1?.userName == e2?.userName &&
        e1?.userImage == e2?.userImage &&
        listEquality.equals(e1?.serviceAspects, e2?.serviceAspects);
  }

  @override
  int hash(ServiceReviewRecord? e) => const ListEquality().hash([
        e?.rate,
        e?.images,
        e?.reviewDate,
        e?.published,
        e?.anonymous,
        e?.comment,
        e?.userName,
        e?.userImage,
        e?.serviceAspects
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceReviewRecord;
}
