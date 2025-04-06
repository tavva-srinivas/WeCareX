import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionaireRecord extends FirestoreRecord {
  QuestionaireRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _response = snapshotData['response'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('questionaire')
          : FirebaseFirestore.instance.collectionGroup('questionaire');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questionaire').doc(id);

  static Stream<QuestionaireRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionaireRecord.fromSnapshot(s));

  static Future<QuestionaireRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionaireRecord.fromSnapshot(s));

  static QuestionaireRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionaireRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionaireRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionaireRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionaireRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionaireRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionaireRecordData({
  String? question,
  String? response,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'response': response,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionaireRecordDocumentEquality
    implements Equality<QuestionaireRecord> {
  const QuestionaireRecordDocumentEquality();

  @override
  bool equals(QuestionaireRecord? e1, QuestionaireRecord? e2) {
    return e1?.question == e2?.question && e1?.response == e2?.response;
  }

  @override
  int hash(QuestionaireRecord? e) =>
      const ListEquality().hash([e?.question, e?.response]);

  @override
  bool isValidKey(Object? o) => o is QuestionaireRecord;
}
