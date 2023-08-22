import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/auth_controller.dart';
import 'package:quiz_study_app/Controllers/question_paper/question_contriller_extention.dart';
import 'package:quiz_study_app/Controllers/question_paper/question_paper_Controller.dart';
import 'package:quiz_study_app/Screens/Home/home_Screen.dart';
import 'package:quiz_study_app/Screens/Questions/result_Screen.dart';
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

  //Timer
  Timer? timer;
  int remaindSeconds = 1;
  final time = "00.00".obs;
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
      }
    } catch (e) {
      print(e.toString());
    }
    if (questionPaperM.questions != null &&
        questionPaperM.questions!.isNotEmpty) {
      allQuestions.assignAll(questionPaperM.questions!);

      print(questionPaperM.questions![0].question);
      currentQuestion.value = questionPaperM.questions![0];
      startTime(questionPaperM.timeSeconds);

      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answers_list', 'answer_review_list']);
  }

  String get completTest {
    final answered = allQuestions
        .where((element) => element.selectedAnswer != null)
        .toList()
        .length;
    return "$answered out of ${allQuestions.length} answered";
  }

  void jumpeToQuestion(int index, {bool isGOBack = true}) {
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if (isGOBack) {
      Get.back();
    }
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

  startTime(int seconds) {
    const duration = Duration(seconds: 1);
    remaindSeconds = seconds;
    timer = Timer.periodic(duration, (timer) {
      if (remaindSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remaindSeconds ~/ 60;
        int seconds = remaindSeconds % 60;
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remaindSeconds--;
      }
    });
  }

  void completed() {
    timer!.cancel();
    Get.offAndToNamed(ResultScreen.routeName);
  }

  void tryAgain() {
    Get.find<QuestionPaperController>()
        .navigatorToQuestion(paper: questionPaperModel, tryagain: true);
  }

  void navigatorToHome() {
    timer!.cancel();
    Get.offNamedUntil(HomeScreen.routeName, (route) => false);
  }
}
