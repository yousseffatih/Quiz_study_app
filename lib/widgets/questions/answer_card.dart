import 'package:flutter/material.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';

enum AnswerStatus {
  correct,
  wrong,
  answerd,
  notanswerd,
}

class QuestionCard_ extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const QuestionCard_({
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

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UiParameters.cardBorderRaduis,
        color: correctAnswerColor.withOpacity(0.2),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
          color: correctAnswerColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  const NotAnswered({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UiParameters.cardBorderRaduis,
        color: notAnswerdColor.withOpacity(0.2),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
          color: notAnswerdColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UiParameters.cardBorderRaduis,
        color: wrongAnswerColor.withOpacity(0.2),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
          color: wrongAnswerColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
