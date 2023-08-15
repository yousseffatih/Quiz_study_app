import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/question_paper_Controller.dart';
import 'package:quiz_study_app/Screens/Home/question_card.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';
import 'package:quiz_study_app/widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: ContentArea(
        addPadding: false,
        child: Obx(() => ListView.separated(
              padding: UiParameters.mobileScreenPadding,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return QuestionCard(
                  model: questionPaperController.allPapers[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: questionPaperController.allPapers.length,
            )),
      ),
    );
  }
}
