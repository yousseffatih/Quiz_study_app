import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';

TextStyle cardTitle(BuildContext context) => TextStyle(
      color: UiParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailText = TextStyle(fontSize: 12);
const headText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor,
);

const questionText = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const appBarText = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: onSurfaceTextColor,
);
TextStyle countDownText() => TextStyle(
      letterSpacing: 2,
      color: UiParameters.isDarkMode()
          ? Theme.of(Get.context!).textTheme.bodyText1!.color
          : Theme.of(Get.context!).primaryColor,
    );
