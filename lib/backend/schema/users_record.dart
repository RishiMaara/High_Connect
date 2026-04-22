import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "support" field.
  DocumentReference? _support;
  DocumentReference? get support => _support;
  bool hasSupport() => _support != null;

  // "sign_up" field.
  bool? _signUp;
  bool get signUp => _signUp ?? false;
  bool hasSignUp() => _signUp != null;

  // "email_sign_up" field.
  bool? _emailSignUp;
  bool get emailSignUp => _emailSignUp ?? false;
  bool hasEmailSignUp() => _emailSignUp != null;

  // "selected_address" field.
  DocumentReference? _selectedAddress;
  DocumentReference? get selectedAddress => _selectedAddress;
  bool hasSelectedAddress() => _selectedAddress != null;

  // "service" field.
  DocumentReference? _service;
  DocumentReference? get service => _service;
  bool hasService() => _service != null;

  // "in_service" field.
  bool? _inService;
  bool get inService => _inService ?? false;
  bool hasInService() => _inService != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _birthDate = snapshotData['birth_date'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _bio = snapshotData['bio'] as String?;
    _support = snapshotData['support'] as DocumentReference?;
    _signUp = snapshotData['sign_up'] as bool?;
    _emailSignUp = snapshotData['email_sign_up'] as bool?;
    _selectedAddress = snapshotData['selected_address'] as DocumentReference?;
    _service = snapshotData['service'] as DocumentReference?;
    _inService = snapshotData['in_service'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? lastName,
  String? firstName,
  DateTime? birthDate,
  String? gender,
  String? bio,
  DocumentReference? support,
  bool? signUp,
  bool? emailSignUp,
  DocumentReference? selectedAddress,
  DocumentReference? service,
  bool? inService,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'last_name': lastName,
      'first_name': firstName,
      'birth_date': birthDate,
      'gender': gender,
      'bio': bio,
      'support': support,
      'sign_up': signUp,
      'email_sign_up': emailSignUp,
      'selected_address': selectedAddress,
      'service': service,
      'in_service': inService,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastName == e2?.lastName &&
        e1?.firstName == e2?.firstName &&
        e1?.birthDate == e2?.birthDate &&
        e1?.gender == e2?.gender &&
        e1?.bio == e2?.bio &&
        e1?.support == e2?.support &&
        e1?.signUp == e2?.signUp &&
        e1?.emailSignUp == e2?.emailSignUp &&
        e1?.selectedAddress == e2?.selectedAddress &&
        e1?.service == e2?.service &&
        e1?.inService == e2?.inService;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.lastName,
        e?.firstName,
        e?.birthDate,
        e?.gender,
        e?.bio,
        e?.support,
        e?.signUp,
        e?.emailSignUp,
        e?.selectedAddress,
        e?.service,
        e?.inService
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
