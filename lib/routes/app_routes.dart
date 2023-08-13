import 'package:get/get.dart';
import 'package:quiz_study_app/Screens/Introduction/introduction.dart';
import 'package:quiz_study_app/Screens/Splach/splash_screen.dart';

class AppRoutes {
  static routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
      ];
}
