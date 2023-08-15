import 'package:flutter/material.dart';
import 'package:quiz_study_app/configs/themes/app_dark_theme.dart';
import 'package:quiz_study_app/configs/themes/app_light_theme.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
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

custumScaffoldColor(BuildContext context) {
  // UiParameters.isDarkMode()
  //     ? const Color.fromARGB(255, 20, 46, 158)
  //     : const Color.fromARGB(255, 221, 221, 221);
  UiParameters.isDarkMode()
      ? const Color(0xFF2e3c62)
      : const Color.fromARGB(255, 240, 237, 255);
}
