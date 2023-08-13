import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/theme_controller.dart';
import 'package:quiz_study_app/bidings/initial_bidings.dart';
import 'package:quiz_study_app/configs/themes/app_dark_theme.dart';
import 'package:quiz_study_app/configs/themes/app_light_theme.dart';
import 'package:quiz_study_app/firebase_options.dart';
import 'package:quiz_study_app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBidings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes(),
    );
  }
}
