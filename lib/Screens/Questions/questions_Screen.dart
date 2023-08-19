import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/questionsController.dart';
import 'package:quiz_study_app/widgets/common/background_decoration.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({super.key});

  static const routeName = "/questionScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background_Decoration(
        child: Center(child: Text("I'm here")),
      ),
    );
  }
}
