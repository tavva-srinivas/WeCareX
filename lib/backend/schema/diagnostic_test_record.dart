import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiagnosticTestRecord extends FirestoreRecord {
  DiagnosticTestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "testName" field.
  String? _testName;
  String get testName => _testName ?? '';
  bool hasTestName() => _testName != null;

  // "isTested" field.
  bool? _isTested;
  bool get isTested => _isTested ?? false;
  bool hasIsTested() => _isTested != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  bool hasRemark() => _remark != null;

  // "testReadings" field.
  String? _testReadings;
  String get testReadings => _testReadings ?? '';
  bool hasTestReadings() => _testReadings != null;

  // "normalRange" field.
  String? _normalRange;
  String get normalRange => _normalRange ?? '';
  bool hasNormalRange() => _normalRange != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _testName = snapshotData['testName'] as String?;
    _isTested = snapshotData['isTested'] as bool?;
    _remark = snapshotData['remark'] as String?;
    _testReadings = snapshotData['testReadings'] as String?;
    _normalRange = snapshotData['normalRange'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('diagnosticTest')
          : FirebaseFirestore.instance.collectionGroup('diagnosticTest');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('diagnosticTest').doc(id);

  static Stream<DiagnosticTestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiagnosticTestRecord.fromSnapshot(s));

  static Future<DiagnosticTestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiagnosticTestRecord.fromSnapshot(s));

  static DiagnosticTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiagnosticTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiagnosticTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiagnosticTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiagnosticTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiagnosticTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiagnosticTestRecordData({
  String? testName,
  bool? isTested,
  String? remark,
  String? testReadings,
  String? normalRange,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'testName': testName,
      'isTested': isTested,
      'remark': remark,
      'testReadings': testReadings,
      'normalRange': normalRange,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiagnosticTestRecordDocumentEquality
    implements Equality<DiagnosticTestRecord> {
  const DiagnosticTestRecordDocumentEquality();

  @override
  bool equals(DiagnosticTestRecord? e1, DiagnosticTestRecord? e2) {
    return e1?.testName == e2?.testName &&
        e1?.isTested == e2?.isTested &&
        e1?.remark == e2?.remark &&
        e1?.testReadings == e2?.testReadings &&
        e1?.normalRange == e2?.normalRange;
  }

  @override
  int hash(DiagnosticTestRecord? e) => const ListEquality().hash(
      [e?.testName, e?.isTested, e?.remark, e?.testReadings, e?.normalRange]);

  @override
  bool isValidKey(Object? o) => o is DiagnosticTestRecord;
}
