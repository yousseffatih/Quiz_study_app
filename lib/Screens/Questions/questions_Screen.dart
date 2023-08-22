import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/questionsController.dart';
import 'package:quiz_study_app/Screens/Questions/test_overview_Screen.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/configs/themes/custul_text_style.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';
import 'package:quiz_study_app/firebase_ref/loding_status.dart';
import 'package:quiz_study_app/widgets/common/background_decoration.dart';
import 'package:quiz_study_app/widgets/common/custum_app_bar.dart';
import 'package:quiz_study_app/widgets/common/main_button.dart';
import 'package:quiz_study_app/widgets/common/question_place_holder.dart';
import 'package:quiz_study_app/widgets/content_area.dart';
import 'package:quiz_study_app/widgets/questions/answer_card.dart';
import 'package:quiz_study_app/widgets/questions/count_down_timer.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({super.key});

  static const routeName = "/questionScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustumAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(color: onSurfaceTextColor, width: 2),
            ),
          ),
          child: Obx(
            () => CountDownTimer(
              time: controller.time.value,
              color: onSurfaceTextColor,
            ),
          ),
        ),
        showActionIcon: true,
        titleWidget: Obx(
          () => Text(
            "Q . ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
            style: appBarText,
          ),
        ),
      ),
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
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: questionText,
                            ),
                            GetBuilder<QuestionsController>(
                                id: 'answers_list',
                                builder: (context) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(top: 25),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller
                                        .currentQuestion.value!.answers.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 10,
                                    ),
                                    itemBuilder: (context, index) {
                                      final answer = controller.currentQuestion
                                          .value!.answers[index];
                                      return QuestionCard_(
                                        answer:
                                            "${answer.identifier}.${answer.answer}",
                                        onTap: () {
                                          controller.selectedAnswer(
                                              answer.identifier!);
                                        },
                                        isSelected: answer.identifier ==
                                            controller.currentQuestion.value!
                                                .selectedAnswer,
                                      );
                                    },
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: UiParameters.mobileScreenPadding,
                child: Row(
                  children: [
                    Visibility(
                      visible: controller.isFirstQuestion,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: MainButton(
                            onTap: () {
                              controller.prefQuestion();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Get.isDarkMode
                                  ? onSurfaceTextColor
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Visibility(
                          visible: controller.loadingStatus.value ==
                              LoadingStatus.completed,
                          child: MainButton(
                            onTap: () {
                              controller.isLastQuestion
                                  ? Get.toNamed(TestOverviewScreen.routeName)
                                  : controller.nextQuestion();
                            },
                            title:
                                controller.isLastQuestion ? "Complete" : "Next",
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
