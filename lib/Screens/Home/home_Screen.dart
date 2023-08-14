import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/question_paper_Controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
        body: Obx(
      () => ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: SizedBox(
              height: 200,
              width: 200,
              child: FadeInImage(
                image:
                    NetworkImage(questionPaperController.allpaperImages[index]),
                placeholder:
                    const AssetImage("assets/images/app_splash_logo.png"),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: questionPaperController.allpaperImages.length,
      ),
    ));
  }
}