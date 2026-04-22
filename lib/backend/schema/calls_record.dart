import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallsRecord extends FirestoreRecord {
  CallsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "call_accepted" field.
  bool? _callAccepted;
  bool get callAccepted => _callAccepted ?? false;
  bool hasCallAccepted() => _callAccepted != null;

  // "call_type" field.
  int? _callType;
  int get callType => _callType ?? 0;
  bool hasCallType() => _callType != null;

  // "call_time" field.
  DateTime? _callTime;
  DateTime? get callTime => _callTime;
  bool hasCallTime() => _callTime != null;

  // "users_ref" field.
  List<DocumentReference>? _usersRef;
  List<DocumentReference> get usersRef => _usersRef ?? const [];
  bool hasUsersRef() => _usersRef != null;

  // "outgoing" field.
  DocumentReference? _outgoing;
  DocumentReference? get outgoing => _outgoing;
  bool hasOutgoing() => _outgoing != null;

  void _initializeFields() {
    _callAccepted = snapshotData['call_accepted'] as bool?;
    _callType = castToType<int>(snapshotData['call_type']);
    _callTime = snapshotData['call_time'] as DateTime?;
    _usersRef = getDataList(snapshotData['users_ref']);
    _outgoing = snapshotData['outgoing'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calls');

  static Stream<CallsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CallsRecord.fromSnapshot(s));

  static Future<CallsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CallsRecord.fromSnapshot(s));

  static CallsRecord fromSnapshot(DocumentSnapshot snapshot) => CallsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CallsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CallsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CallsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CallsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCallsRecordData({
  bool? callAccepted,
  int? callType,
  DateTime? callTime,
  DocumentReference? outgoing,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'call_accepted': callAccepted,
      'call_type': callType,
      'call_time': callTime,
      'outgoing': outgoing,
    }.withoutNulls,
  );

  return firestoreData;
}

class CallsRecordDocumentEquality implements Equality<CallsRecord> {
  const CallsRecordDocumentEquality();

  @override
  bool equals(CallsRecord? e1, CallsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.callAccepted == e2?.callAccepted &&
        e1?.callType == e2?.callType &&
        e1?.callTime == e2?.callTime &&
        listEquality.equals(e1?.usersRef, e2?.usersRef) &&
        e1?.outgoing == e2?.outgoing;
  }

  @override
  int hash(CallsRecord? e) => const ListEquality().hash(
      [e?.callAccepted, e?.callType, e?.callTime, e?.usersRef, e?.outgoing]);

  @override
  bool isValidKey(Object? o) => o is CallsRecord;
}
