import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// List of doctorrs
class DoctorsRecord extends FirestoreRecord {
  DoctorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "doctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  // "Specialisation" field.
  String? _specialisation;
  String get specialisation => _specialisation ?? '';
  bool hasSpecialisation() => _specialisation != null;

  // "Availability" field.
  String? _availability;
  String get availability => _availability ?? '';
  bool hasAvailability() => _availability != null;

  // "Experience" field.
  int? _experience;
  int get experience => _experience ?? 0;
  bool hasExperience() => _experience != null;

  // "hospitalName" field.
  String? _hospitalName;
  String get hospitalName => _hospitalName ?? '';
  bool hasHospitalName() => _hospitalName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _doctorName = snapshotData['doctorName'] as String?;
    _specialisation = snapshotData['Specialisation'] as String?;
    _availability = snapshotData['Availability'] as String?;
    _experience = castToType<int>(snapshotData['Experience']);
    _hospitalName = snapshotData['hospitalName'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorsRecord.fromSnapshot(s));

  static Future<DoctorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorsRecord.fromSnapshot(s));

  static DoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorsRecordData({
  String? doctorName,
  String? specialisation,
  String? availability,
  int? experience,
  String? hospitalName,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doctorName': doctorName,
      'Specialisation': specialisation,
      'Availability': availability,
      'Experience': experience,
      'hospitalName': hospitalName,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoctorsRecordDocumentEquality implements Equality<DoctorsRecord> {
  const DoctorsRecordDocumentEquality();

  @override
  bool equals(DoctorsRecord? e1, DoctorsRecord? e2) {
    return e1?.doctorName == e2?.doctorName &&
        e1?.specialisation == e2?.specialisation &&
        e1?.availability == e2?.availability &&
        e1?.experience == e2?.experience &&
        e1?.hospitalName == e2?.hospitalName &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(DoctorsRecord? e) => const ListEquality().hash([
        e?.doctorName,
        e?.specialisation,
        e?.availability,
        e?.experience,
        e?.hospitalName,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is DoctorsRecord;
}
