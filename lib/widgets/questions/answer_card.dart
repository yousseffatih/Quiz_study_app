import 'package:flutter/material.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';

enum AnswerStatus {
  correct,
  wrong,
  answerd,
  notanswerd,
}

class QuestionCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const QuestionCard({
    super.key,
    required this.answer,
    this.isSelected = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UiParameters.cardBorderRaduis,
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Text(
          answer,
          style: TextStyle(color: isSelected ? onSurfaceTextColor : null),
        ),
        decoration: BoxDecoration(
          borderRadius: UiParameters.cardBorderRaduis,
          color:
              isSelected ? answerSelectedColor() : Theme.of(context).cardColor,
          border: Border.all(
            color: isSelected ? answerSelectedColor() : answerBorderColor(),
          ),
        ),
      ),
    );
  }
}
