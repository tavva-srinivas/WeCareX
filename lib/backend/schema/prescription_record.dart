import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrescriptionRecord extends FirestoreRecord {
  PrescriptionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "symptomSummary" field.
  String? _symptomSummary;
  String get symptomSummary => _symptomSummary ?? '';
  bool hasSymptomSummary() => _symptomSummary != null;

  // "possibleConditions" field.
  List<String>? _possibleConditions;
  List<String> get possibleConditions => _possibleConditions ?? const [];
  bool hasPossibleConditions() => _possibleConditions != null;

  // "questionaire" field.
  List<String>? _questionaire;
  List<String> get questionaire => _questionaire ?? const [];
  bool hasQuestionaire() => _questionaire != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _symptomSummary = snapshotData['symptomSummary'] as String?;
    _possibleConditions = getDataList(snapshotData['possibleConditions']);
    _questionaire = getDataList(snapshotData['questionaire']);
    _answers = getDataList(snapshotData['answers']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('prescription')
          : FirebaseFirestore.instance.collectionGroup('prescription');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('prescription').doc(id);

  static Stream<PrescriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrescriptionRecord.fromSnapshot(s));

  static Future<PrescriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrescriptionRecord.fromSnapshot(s));

  static PrescriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrescriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrescriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrescriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrescriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrescriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrescriptionRecordData({
  String? symptomSummary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'symptomSummary': symptomSummary,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrescriptionRecordDocumentEquality
    implements Equality<PrescriptionRecord> {
  const PrescriptionRecordDocumentEquality();

  @override
  bool equals(PrescriptionRecord? e1, PrescriptionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.symptomSummary == e2?.symptomSummary &&
        listEquality.equals(e1?.possibleConditions, e2?.possibleConditions) &&
        listEquality.equals(e1?.questionaire, e2?.questionaire) &&
        listEquality.equals(e1?.answers, e2?.answers);
  }

  @override
  int hash(PrescriptionRecord? e) => const ListEquality().hash(
      [e?.symptomSummary, e?.possibleConditions, e?.questionaire, e?.answers]);

  @override
  bool isValidKey(Object? o) => o is PrescriptionRecord;
}
