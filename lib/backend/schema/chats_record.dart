import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "last_message" field.
  DocumentReference? _lastMessage;
  DocumentReference? get lastMessage => _lastMessage;
  bool hasLastMessage() => _lastMessage != null;

  // "users_ref" field.
  List<DocumentReference>? _usersRef;
  List<DocumentReference> get usersRef => _usersRef ?? const [];
  bool hasUsersRef() => _usersRef != null;

  // "last_message_text" field.
  String? _lastMessageText;
  String get lastMessageText => _lastMessageText ?? '';
  bool hasLastMessageText() => _lastMessageText != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "user1" field.
  DocumentReference? _user1;
  DocumentReference? get user1 => _user1;
  bool hasUser1() => _user1 != null;

  // "user2" field.
  DocumentReference? _user2;
  DocumentReference? get user2 => _user2;
  bool hasUser2() => _user2 != null;

  // "unread_count_user1" field.
  int? _unreadCountUser1;
  int get unreadCountUser1 => _unreadCountUser1 ?? 0;
  bool hasUnreadCountUser1() => _unreadCountUser1 != null;

  // "unread_count_user2" field.
  int? _unreadCountUser2;
  int get unreadCountUser2 => _unreadCountUser2 ?? 0;
  bool hasUnreadCountUser2() => _unreadCountUser2 != null;

  void _initializeFields() {
    _startDate = snapshotData['start_date'] as DateTime?;
    _lastMessage = snapshotData['last_message'] as DocumentReference?;
    _usersRef = getDataList(snapshotData['users_ref']);
    _lastMessageText = snapshotData['last_message_text'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _user1 = snapshotData['user1'] as DocumentReference?;
    _user2 = snapshotData['user2'] as DocumentReference?;
    _unreadCountUser1 = castToType<int>(snapshotData['unread_count_user1']);
    _unreadCountUser2 = castToType<int>(snapshotData['unread_count_user2']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DateTime? startDate,
  DocumentReference? lastMessage,
  String? lastMessageText,
  DateTime? lastMessageTime,
  DocumentReference? user1,
  DocumentReference? user2,
  int? unreadCountUser1,
  int? unreadCountUser2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start_date': startDate,
      'last_message': lastMessage,
      'last_message_text': lastMessageText,
      'last_message_time': lastMessageTime,
      'user1': user1,
      'user2': user2,
      'unread_count_user1': unreadCountUser1,
      'unread_count_user2': unreadCountUser2,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.startDate == e2?.startDate &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(e1?.usersRef, e2?.usersRef) &&
        e1?.lastMessageText == e2?.lastMessageText &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.user1 == e2?.user1 &&
        e1?.user2 == e2?.user2 &&
        e1?.unreadCountUser1 == e2?.unreadCountUser1 &&
        e1?.unreadCountUser2 == e2?.unreadCountUser2;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.startDate,
        e?.lastMessage,
        e?.usersRef,
        e?.lastMessageText,
        e?.lastMessageTime,
        e?.user1,
        e?.user2,
        e?.unreadCountUser1,
        e?.unreadCountUser2,
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
