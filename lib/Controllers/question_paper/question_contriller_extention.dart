import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/questionsController.dart';

import '../../firebase_ref/references.dart';
import '../auth_controller.dart';

extension QuestionControllerExtension on QuestionsController {
  int get CorrectQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnswerdQuestion {
    return "$CorrectQuestionCount of all ${allQuestions.length} are Correct";
  }

  String get points {
    //return "You have a ${CorrectQuestionCount * 2} points";
    var points = (CorrectQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remaindSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestResult() async {
    var batch = firestore.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) {
      return;
    }
    batch.set(
        userRf
            .doc(user.email)
            .collection("myrecent_tests")
            .doc(questionPaperModel.id),
        {
          "points": points,
          "correct_answer": "$CorrectQuestionCount/${allQuestions.length}",
          "question_id": questionPaperModel.id,
          "time": questionPaperModel.timeSeconds - remaindSeconds,
        });
    batch.commit();
    navigatorToHome();
  }
}
