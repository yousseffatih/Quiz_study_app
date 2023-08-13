import 'package:flutter/material.dart';

class UiParameters {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
