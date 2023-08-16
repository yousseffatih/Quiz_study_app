import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25.0;
const double _cardBorderRaduis = 10.0;

double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRaduis => _cardBorderRaduis;

class UiParameters {
  static BorderRadius get cardBorderRaduis =>
      BorderRadius.circular(_cardBorderRaduis);

  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}
