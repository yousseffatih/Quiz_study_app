import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/configs/themes/app_dark_theme.dart';
import 'package:quiz_study_app/configs/themes/app_light_theme.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFFf85187);
const Color notAnswerdColor = Color(0xff2a3c65);


const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight,
  ],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColorDark,
    primaryColorDark,
  ],
);

LinearGradient mainGradient() =>
    UiParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color custumScaffoldColor(BuildContext context) {
  // UiParameters.isDarkMode()
  //     ? const Color.fromARGB(255, 20, 46, 158)
  //     : const Color.fromARGB(255, 221, 221, 221);
  return UiParameters.isDarkMode()
      ? const Color(0xFF2e3c62)
      : const Color.fromARGB(255, 222, 237, 255);
}

Color answerSelectedColor() {
  return UiParameters.isDarkMode()
      ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
      : Theme.of(Get.context!).primaryColor;
}

Color answerBorderColor() {
  return UiParameters.isDarkMode()
      ? const Color.fromARGB(255, 20, 46, 158)
      : const Color.fromARGB(255, 221, 221, 221);
}
