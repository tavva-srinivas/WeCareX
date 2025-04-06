import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationRecord extends FirestoreRecord {
  MedicationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "medicineName" field.
  String? _medicineName;
  String get medicineName => _medicineName ?? '';
  bool hasMedicineName() => _medicineName != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "schedule" field.
  String? _schedule;
  String get schedule => _schedule ?? '';
  bool hasSchedule() => _schedule != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _medicineName = snapshotData['medicineName'] as String?;
    _reason = snapshotData['reason'] as String?;
    _schedule = snapshotData['schedule'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('medication')
          : FirebaseFirestore.instance.collectionGroup('medication');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('medication').doc(id);

  static Stream<MedicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationRecord.fromSnapshot(s));

  static Future<MedicationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationRecord.fromSnapshot(s));

  static MedicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationRecordData({
  String? medicineName,
  String? reason,
  String? schedule,
  int? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'medicineName': medicineName,
      'reason': reason,
      'schedule': schedule,
      'duration': duration,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationRecordDocumentEquality implements Equality<MedicationRecord> {
  const MedicationRecordDocumentEquality();

  @override
  bool equals(MedicationRecord? e1, MedicationRecord? e2) {
    return e1?.medicineName == e2?.medicineName &&
        e1?.reason == e2?.reason &&
        e1?.schedule == e2?.schedule &&
        e1?.duration == e2?.duration;
  }

  @override
  int hash(MedicationRecord? e) => const ListEquality()
      .hash([e?.medicineName, e?.reason, e?.schedule, e?.duration]);

  @override
  bool isValidKey(Object? o) => o is MedicationRecord;
}
