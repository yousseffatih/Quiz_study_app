import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/question_paper_Controller.dart';
import 'package:quiz_study_app/Controllers/zoom_drawer_controller.dart';
import 'package:quiz_study_app/Screens/Home/home_Screen.dart';
import 'package:quiz_study_app/Screens/Introduction/introduction.dart';
import 'package:quiz_study_app/Screens/Splach/splash_screen.dart';

class AppRoutes {
  static routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get .put(MyZoomDrawerController());
            })),
      ];
}
