import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/questionsController.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/configs/themes/custul_text_style.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';
import 'package:quiz_study_app/widgets/common/background_decoration.dart';
import 'package:quiz_study_app/widgets/common/custum_app_bar.dart';
import 'package:quiz_study_app/widgets/common/main_button.dart';
import 'package:quiz_study_app/widgets/content_area.dart';
import 'package:quiz_study_app/widgets/questions/answer_card.dart';
import 'package:quiz_study_app/widgets/questions/count_down_timer.dart';
import 'package:quiz_study_app/widgets/questions/question_card_name.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustumAppBar(
        title: controller.completTest,
      ),
      body: background_Decoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                  child: Column(
                children: [
                  Row(
                    children: [
                      CountDownTimer(
                        color: UiParameters.isDarkMode()
                            ? Theme.of(context).textTheme.bodyText1!.color
                            : Theme.of(context).primaryColor,
                        time: "",
                      ),
                      Obx(
                        () => Text(
                          '${controller.time} Remaining',
                          style: countDownText(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      itemCount: controller.allQuestions.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 75,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        AnswerStatus? answerStatus;
                        if (controller.allQuestions[index].selectedAnswer !=
                            null) {
                          answerStatus = AnswerStatus.answerd;
                        }
                        return QuestionNumberCard(
                          index: index + 1,
                          status: answerStatus,
                          onTap: () => controller.jumpeToQuestion(index),
                        );
                      },
                    ),
                  ),
                ],
              )),
            ),
            ColoredBox(
              color: custumScaffoldColor(context),
              child: Padding(
                padding: UiParameters.mobileScreenPadding,
                child: MainButton(
                  onTap: () {
                    controller.completed();
                  },
                  title: "Completed",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
