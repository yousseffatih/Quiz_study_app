import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/question_contriller_extention.dart';
import 'package:quiz_study_app/Controllers/question_paper/questionsController.dart';
import 'package:quiz_study_app/Screens/Questions/quetion_check_answer_Screen.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/configs/themes/custul_text_style.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';
import 'package:quiz_study_app/widgets/common/background_decoration.dart';
import 'package:quiz_study_app/widgets/common/custum_app_bar.dart';
import 'package:quiz_study_app/widgets/common/main_button.dart';
import 'package:quiz_study_app/widgets/content_area.dart';
import 'package:quiz_study_app/widgets/questions/answer_card.dart';
import 'package:quiz_study_app/widgets/questions/question_card_name.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = "/resultScreen";

  @override
  Widget build(BuildContext context) {
    Color textColor =
        Get.isDarkMode ? onSurfaceTextColor : Theme.of(context).primaryColor;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustumAppBar(
          leading: const SizedBox(height: 80),
          title: controller.correctAnswerdQuestion,
        ),
        body: background_Decoration(
            child: Column(
          children: [
            Expanded(
              child: ContentArea(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/images/bulb.svg"),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        "Congratulation",
                        style: headText.copyWith(color: textColor),
                      ),
                    ),
                    Text(
                      "You have a ${controller.points} points",
                      style: TextStyle(color: textColor),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Tap below question numbers to view correct answers',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.allQuestions.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 75,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final question = controller.allQuestions[index];
                        AnswerStatus status = AnswerStatus.notanswerd;
                        final selectedAnswer = question.selectedAnswer;
                        final correctAnswer = question.correctAnswer;
                        if (selectedAnswer == correctAnswer) {
                          status = AnswerStatus.correct;
                        } else if (question.selectedAnswer == null) {
                          status = AnswerStatus.wrong;
                        } else {
                          status = AnswerStatus.wrong;
                        }
                        return QuestionNumberCard(
                          status: status,
                          index: index + 1,
                          onTap: () {
                            controller.jumpeToQuestion(index, isGOBack: false);
                            Get.toNamed(AnswerCheckScreen.routeName);
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: UiParameters.mobileScreenPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        color: Colors.blueGrey,
                        onTap: () {
                          controller.tryAgain();
                        },
                        title: "Try Again",
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: MainButton(
                        //color: Colors.blueGrey,
                        onTap: () {
                          controller.saveTestResult();
                        },
                        title: "Go Home",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
