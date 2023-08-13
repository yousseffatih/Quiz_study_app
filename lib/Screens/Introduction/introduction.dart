import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/widgets/app_circle_button.dart';

import '../../configs/themes/app_colors.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(gradient: mainGradient(context)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 65,
            ),
            const SizedBox(height: 40),
            const Text(
              "This is a study app. You can use it as you want.If vou understand how 1t works vou would be able to scale it.With this you will master firebase backend and flutter front end.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: onSurfaceTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            AppCircleButton(
              ontap: () {},
              child: const Icon(
                Icons.arrow_forward,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
