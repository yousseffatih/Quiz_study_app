import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/questionsController.dart';
import 'package:quiz_study_app/configs/themes/custul_text_style.dart';
import 'package:quiz_study_app/firebase_ref/loding_status.dart';
import 'package:quiz_study_app/widgets/common/background_decoration.dart';
import 'package:quiz_study_app/widgets/common/question_place_holder.dart';
import 'package:quiz_study_app/widgets/content_area.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({super.key});

  static const routeName = "/questionScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background_Decoration(
          child: Obx(
        () => Column(
          children: [
            controller.loadingStatus.value == LoadingStatus.loading
                ? const Expanded(
                    child: ContentArea(
                      child: QuestionScreenHolder(),
                    ),
                  )
                : Expanded(
                    child: ContentArea(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: questionText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}
