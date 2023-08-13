import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/auth_controller.dart';

class InitialBidings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
