import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PatientRecord extends FirestoreRecord {
  PatientRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PatientName" field.
  String? _patientName;
  String get patientName => _patientName ?? '';
  bool hasPatientName() => _patientName != null;

  // "PatientsAge" field.
  int? _patientsAge;
  int get patientsAge => _patientsAge ?? 0;
  bool hasPatientsAge() => _patientsAge != null;

  // "PatientsGender" field.
  String? _patientsGender;
  String get patientsGender => _patientsGender ?? '';
  bool hasPatientsGender() => _patientsGender != null;

  // "PhoneNo" field.
  String? _phoneNo;
  String get phoneNo => _phoneNo ?? '';
  bool hasPhoneNo() => _phoneNo != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _patientName = snapshotData['PatientName'] as String?;
    _patientsAge = castToType<int>(snapshotData['PatientsAge']);
    _patientsGender = snapshotData['PatientsGender'] as String?;
    _phoneNo = snapshotData['PhoneNo'] as String?;
    _address = snapshotData['Address'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('patient');

  static Stream<PatientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PatientRecord.fromSnapshot(s));

  static Future<PatientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PatientRecord.fromSnapshot(s));

  static PatientRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PatientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PatientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PatientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PatientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PatientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPatientRecordData({
  String? patientName,
  int? patientsAge,
  String? patientsGender,
  String? phoneNo,
  String? address,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PatientName': patientName,
      'PatientsAge': patientsAge,
      'PatientsGender': patientsGender,
      'PhoneNo': phoneNo,
      'Address': address,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PatientRecordDocumentEquality implements Equality<PatientRecord> {
  const PatientRecordDocumentEquality();

  @override
  bool equals(PatientRecord? e1, PatientRecord? e2) {
    return e1?.patientName == e2?.patientName &&
        e1?.patientsAge == e2?.patientsAge &&
        e1?.patientsGender == e2?.patientsGender &&
        e1?.phoneNo == e2?.phoneNo &&
        e1?.address == e2?.address &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(PatientRecord? e) => const ListEquality().hash([
        e?.patientName,
        e?.patientsAge,
        e?.patientsGender,
        e?.phoneNo,
        e?.address,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is PatientRecord;
}
