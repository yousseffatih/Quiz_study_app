import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firestore = FirebaseFirestore.instance;
final questionPaperRf = firestore.collection("questionPapers");
final userRf = firestore.collection("users");

DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRf.doc(paperId).collection("questions").doc(questionId);

Reference get firebaseStorage => FirebaseStorage.instance.ref();
