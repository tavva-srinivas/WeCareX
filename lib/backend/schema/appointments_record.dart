import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "patientId" field.
  String? _patientId;
  String get patientId => _patientId ?? '';
  bool hasPatientId() => _patientId != null;

  // "doctorId" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  bool hasDoctorId() => _doctorId != null;

  void _initializeFields() {
    _patientId = snapshotData['patientId'] as String?;
    _doctorId = snapshotData['doctorId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsRecordData({
  String? patientId,
  String? doctorId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'patientId': patientId,
      'doctorId': doctorId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.patientId == e2?.patientId && e1?.doctorId == e2?.doctorId;
  }

  @override
  int hash(AppointmentsRecord? e) =>
      const ListEquality().hash([e?.patientId, e?.doctorId]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
