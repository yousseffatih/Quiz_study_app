import 'package:flutter/material.dart';

import 'sub_theme_data_mixin.dart';

const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);

const Color mainTextDarkColor = Colors.white;

class DarkTheme with SubThemeDataMixin {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextDarkColor,
        displayColor: mainTextDarkColor,
      ),
    );
  }
}
