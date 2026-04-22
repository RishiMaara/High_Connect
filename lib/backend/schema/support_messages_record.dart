import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportMessagesRecord extends FirestoreRecord {
  SupportMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "user_message" field.
  bool? _userMessage;
  bool get userMessage => _userMessage ?? false;
  bool hasUserMessage() => _userMessage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _seen = snapshotData['seen'] as bool?;
    _image = snapshotData['image'] as String?;
    _userMessage = snapshotData['user_message'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('support_messages')
          : FirebaseFirestore.instance.collectionGroup('support_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('support_messages').doc(id);

  static Stream<SupportMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportMessagesRecord.fromSnapshot(s));

  static Future<SupportMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportMessagesRecord.fromSnapshot(s));

  static SupportMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportMessagesRecordData({
  String? message,
  DateTime? timeStamp,
  bool? seen,
  String? image,
  bool? userMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'time_stamp': timeStamp,
      'seen': seen,
      'image': image,
      'user_message': userMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportMessagesRecordDocumentEquality
    implements Equality<SupportMessagesRecord> {
  const SupportMessagesRecordDocumentEquality();

  @override
  bool equals(SupportMessagesRecord? e1, SupportMessagesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.seen == e2?.seen &&
        e1?.image == e2?.image &&
        e1?.userMessage == e2?.userMessage;
  }

  @override
  int hash(SupportMessagesRecord? e) => const ListEquality()
      .hash([e?.message, e?.timeStamp, e?.seen, e?.image, e?.userMessage]);

  @override
  bool isValidKey(Object? o) => o is SupportMessagesRecord;
}
