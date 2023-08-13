import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/auth_controller.dart';
import 'package:quiz_study_app/Controllers/theme_controller.dart';

class InitialBidings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
