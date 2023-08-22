import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/question_paper/question_paper_Controller.dart';
import 'package:quiz_study_app/Controllers/question_paper/questionsController.dart';
import 'package:quiz_study_app/Controllers/zoom_drawer_controller.dart';
import 'package:quiz_study_app/Screens/Home/home_Screen.dart';
import 'package:quiz_study_app/Screens/Introduction/introduction.dart';
import 'package:quiz_study_app/Screens/Login/login_screen.dart';
import 'package:quiz_study_app/Screens/Questions/questions_Screen.dart';
import 'package:quiz_study_app/Screens/Questions/quetion_check_answer_Screen.dart';
import 'package:quiz_study_app/Screens/Questions/result_Screen.dart';
import 'package:quiz_study_app/Screens/Questions/test_overview_Screen.dart';
import 'package:quiz_study_app/Screens/Splach/splash_screen.dart';

class AppRoutes {
  static routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            },
          ),
        ),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
          name: QuestionScreen.routeName,
          page: () => const QuestionScreen(),
          binding: BindingsBuilder(() {
            Get.put<QuestionsController>(QuestionsController());
          }),
        ),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => const TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: AnswerCheckScreen.routeName,
          page: () => const AnswerCheckScreen(),
        ),
      ];
}
