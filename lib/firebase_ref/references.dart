import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
final questionPaperRf = firestore.collection("questionPapers");

DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRf.doc(paperId).collection("questions").doc(questionId);
