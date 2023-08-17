import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/auth_controller.dart';
import 'package:quiz_study_app/configs/themes/app_colors.dart';
import 'package:quiz_study_app/widgets/common/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Text(
                "This is a studv app. You can use as vou want.You have the full access to all the materials in this course",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MainButton(
              onTap: () {
                controller.singInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: SvgPicture.asset("assets/icons/google.svg"),
                  ),
                  Center(
                    child: Text(
                      "Sing in with Google",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
