import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/questionsController.dart';
import 'package:quiz_study_app/Screens/Questions/result_Screen.dart';
import 'package:quiz_study_app/configs/themes/custul_text_style.dart';
import 'package:quiz_study_app/widgets/common/background_decoration.dart';
import 'package:quiz_study_app/widgets/common/custum_app_bar.dart';
import 'package:quiz_study_app/widgets/content_area.dart';
import 'package:quiz_study_app/widgets/questions/answer_card.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({super.key});

  static const String routeName = "/answercheckscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustumAppBar(
        titleWidget: Obx(
          () => Text(
            "Q . ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}",
            style: appBarText,
          ),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: background_Decoration(
        child: Obx(() => Column(
              children: [
                Expanded(
                    child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          "${controller.currentQuestion.value!.question}",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<QuestionsController>(
                          id: 'answer_review_list',
                          builder: (context) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final answer = controller
                                    .currentQuestion.value!.answers[index];
                                final selectedAnswer = controller
                                    .currentQuestion.value!.selectedAnswer;
                                final correctAnswer = controller
                                    .currentQuestion.value!.correctAnswer;
                                final String answerText =
                                    '${answer.identifier} . ${answer.answer}';
                                if (correctAnswer == selectedAnswer &&
                                    answer.identifier == selectedAnswer) {
                                  return CorrectAnswer(answer: answerText);
                                } else if (selectedAnswer == null) {
                                  return NotAnswered(answer: answerText);
                                } else if (correctAnswer != selectedAnswer &&
                                    answer.identifier == selectedAnswer) {
                                  return WrongAnswer(answer: answerText);
                                } else if (correctAnswer == answer.identifier) {
                                  return CorrectAnswer(answer: answerText);
                                }
                                return QuestionCard_(
                                  answer: answerText,
                                  onTap: () {},
                                  isSelected: false,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              itemCount: controller
                                  .currentQuestion.value!.answers.length,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
