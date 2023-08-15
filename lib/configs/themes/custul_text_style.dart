import 'package:flutter/material.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';

TextStyle cardTitle(BuildContext context) => TextStyle(
      color: UiParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailText = TextStyle(fontSize: 12);
