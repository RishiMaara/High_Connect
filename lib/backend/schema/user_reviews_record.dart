import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReviewsRecord extends FirestoreRecord {
  UserReviewsRecord._(
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

  // "booking" field.
  DocumentReference? _booking;
  DocumentReference? get booking => _booking;
  bool hasBooking() => _booking != null;

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

  // "service_aspects" field.
  List<String>? _serviceAspects;
  List<String> get serviceAspects => _serviceAspects ?? const [];
  bool hasServiceAspects() => _serviceAspects != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rate = castToType<double>(snapshotData['rate']);
    _images = getDataList(snapshotData['images']);
    _reviewDate = snapshotData['review_date'] as DateTime?;
    _booking = snapshotData['booking'] as DocumentReference?;
    _published = snapshotData['published'] as bool?;
    _anonymous = snapshotData['anonymous'] as bool?;
    _comment = snapshotData['comment'] as String?;
    _serviceAspects = getDataList(snapshotData['service_aspects']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_reviews')
          : FirebaseFirestore.instance.collectionGroup('user_reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_reviews').doc(id);

  static Stream<UserReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserReviewsRecord.fromSnapshot(s));

  static Future<UserReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserReviewsRecord.fromSnapshot(s));

  static UserReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserReviewsRecordData({
  double? rate,
  DateTime? reviewDate,
  DocumentReference? booking,
  bool? published,
  bool? anonymous,
  String? comment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rate': rate,
      'review_date': reviewDate,
      'booking': booking,
      'published': published,
      'anonymous': anonymous,
      'comment': comment,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserReviewsRecordDocumentEquality implements Equality<UserReviewsRecord> {
  const UserReviewsRecordDocumentEquality();

  @override
  bool equals(UserReviewsRecord? e1, UserReviewsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rate == e2?.rate &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.reviewDate == e2?.reviewDate &&
        e1?.booking == e2?.booking &&
        e1?.published == e2?.published &&
        e1?.anonymous == e2?.anonymous &&
        e1?.comment == e2?.comment &&
        listEquality.equals(e1?.serviceAspects, e2?.serviceAspects);
  }

  @override
  int hash(UserReviewsRecord? e) => const ListEquality().hash([
        e?.rate,
        e?.images,
        e?.reviewDate,
        e?.booking,
        e?.published,
        e?.anonymous,
        e?.comment,
        e?.serviceAspects
      ]);

  @override
  bool isValidKey(Object? o) => o is UserReviewsRecord;
}
