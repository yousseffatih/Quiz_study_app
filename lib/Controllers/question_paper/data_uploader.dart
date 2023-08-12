import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/firebase_ref/loding_status.dart';
import 'package:quiz_study_app/firebase_ref/references.dart';
import 'package:quiz_study_app/models/Question_Paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  void uploadData() async {
    loadingStatus.value = LoadingStatus.loading;
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json fileand print path
    final paperInAssets = manifestMap.keys
        .where((element) =>
            element.startsWith("assets/DB/papers/") &&
            element.contains(".json"))
        .toList();
    List<QuestionPaperModel> questionPaperModel = [];
    for (var paper in paperInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPaperModel
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    // print("items number ${questionPaperModel[0].id}");
    var batch = fireStore.batch();
    for (var paper in questionPaperModel) {
      batch.set(questionPaperRf.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length
      });
      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });
        for (var answers in questions.answers) {
          batch
              .set(questionPath.collection("answers").doc(answers.identifier), {
            "identifier": answers.identifier,
            "Answer": answers.answer,
          });
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
