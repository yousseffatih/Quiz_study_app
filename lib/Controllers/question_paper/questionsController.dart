import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/firebase_ref/loding_status.dart';
import 'package:quiz_study_app/firebase_ref/references.dart';
import 'package:quiz_study_app/models/Question.dart';
import 'package:quiz_study_app/models/Question_Paper_model.dart';

import '../../models/Answer.dart';

class QuestionsController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Question>[];
  final questionIndex = 0.obs;
  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;
  Rxn<Question> currentQuestion = Rxn<Question>();
  @override
  void onReady() {
    final questionPaper = Get.arguments as QuestionPaperModel;
    LoadData(questionPaper);
    super.onReady();
  }

  Future<void> LoadData(QuestionPaperModel questionPaperM) async {
    questionPaperModel = questionPaperM;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          (await questionPaperRf
              .doc(questionPaperM.id)
              .collection("questions")
              .get());
      final questions = questionQuery.docs
          .map((snapshot) => Question.fromSnapshot(snapshot))
          .toList();
      questionPaperM.questions = questions;
      for (Question _question in questionPaperM.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answerQuery =
            (await questionPaperRf
                .doc(questionPaperM.id)
                .collection("questions")
                .doc(_question.id)
                .collection("answers")
                .get());
        final answers = answerQuery.docs
            .map((answer) => Answer.fromSnapshot(answer))
            .toList();
        _question.answers = answers;
        if (questionPaperM.questions != null &&
            questionPaperM.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaperM.questions!);
          if (kDebugMode) {
            print(questionPaperM.questions![0].question);
            currentQuestion.value = questionPaperM.questions![0];
          }
          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answers_list']);
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) {
      return;
    }
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void prefQuestion() {
    if (questionIndex.value > 0) {
      questionIndex.value--;
      currentQuestion.value = allQuestions[questionIndex.value];
    }
  }
}
