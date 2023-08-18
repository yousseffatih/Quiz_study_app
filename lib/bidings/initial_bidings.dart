import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/auth_controller.dart';
import 'package:quiz_study_app/Controllers/question_paper/question_paper_Controller.dart';
import 'package:quiz_study_app/Controllers/theme_controller.dart';
import '../services/firestore_services.dart';

class InitialBidings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(QuestionPaperController(), permanent: true);
    Get.put(ZoomDrawerController(), permanent: true);
    Get.put(FirebaseStorageService(), permanent: true);
  }
}
