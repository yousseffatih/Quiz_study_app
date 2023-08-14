import 'package:get/get.dart';
import 'package:quiz_study_app/services/firestore_services.dart';

class QuestionPaperController extends GetxController {
  final allpaperImages = <String>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allpaperImages.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
  }
}
