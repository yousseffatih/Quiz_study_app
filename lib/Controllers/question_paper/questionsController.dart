import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/firebase_ref/references.dart';
import 'package:quiz_study_app/models/Question.dart';
import 'package:quiz_study_app/models/Question_Paper_model.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  @override
  void onReady() {
    final questionPaper = Get.arguments as QuestionPaperModel;
    LoadData(questionPaper);
    super.onReady();
  }

  Future<void> LoadData(QuestionPaperModel questionPaperM) async {
    questionPaperModel = questionPaperM;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          (await questionPaperRf
              .doc(questionPaperM.title)
              .collection("questions")
              .get());
      final questions = questionQuery.docs
          .map((snapshot) => Question.fromSnapshot(snapshot))
          .toList();
      questionPaperM.questions = questions;
    } catch (e) {
      print(e.toString());
    }
  }
}
