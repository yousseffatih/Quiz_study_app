import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/zoom_drawer_controller.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UiParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient(),
      ),
      child: Theme(
          data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
              primary: onSurfaceTextColor,
            )),
          ),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toogleDrawer();
                    }, //549:58
                  ))
            ],
          ))),
    );
  }
}
