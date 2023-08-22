import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';

import 'answer_card.dart';

class QuestionNumberCard extends StatelessWidget {
  const QuestionNumberCard({
    super.key,
    required this.index,
    this.status,
    required this.onTap,
  });
  final int index;
  final AnswerStatus? status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).primaryColor;
    switch (status) {
      case AnswerStatus.answerd:
        backgroundColor = Get.isDarkMode
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor;
        break;

      case AnswerStatus.correct:
        backgroundColor = correctAnswerColor;
        break;

      case AnswerStatus.wrong:
        backgroundColor = wrongAnswerColor;
        break;

      case AnswerStatus.notanswerd:
        backgroundColor = Get.isDarkMode
            ? Colors.red.withOpacity(0.5)
            : Theme.of(context).primaryColor.withOpacity(0.1);
        break;

      default:
        backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
    }
    return InkWell(
      onTap: onTap,
      borderRadius: UiParameters.cardBorderRaduis,
      child: Ink(
        child: Center(
          child: Text(
            "${index.toString()}",
            style: TextStyle(
              color: status == AnswerStatus.notanswerd
                  ? Theme.of(context).primaryColor
                  : null,
            ),
          ),
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: UiParameters.cardBorderRaduis,
        ),
      ),
    );
  }
}
