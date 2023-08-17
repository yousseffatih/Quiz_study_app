import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quiz_study_app/Controllers/auth_controller.dart';
import 'package:quiz_study_app/firebase_ref/references.dart';
import 'package:quiz_study_app/models/Question_Paper_model.dart';
import 'package:quiz_study_app/services/firestore_services.dart';

class QuestionPaperController extends GetxController {
  final allpaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRf.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
        allpaperImages.add(imgUrl!);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print("this is proble : ${e.toString()}");
    }
  }

  void navigatorToQuestion(
      {required QuestionPaperModel paper, bool tryagain = false}) {
    AuthController authController = Get.find();
    if (authController.isLoggedIn()) {
      if (tryagain) {
        Get.back();
        //Get.offNamed();
      } else {
        
        //Get.toNamed();
      }
    } else {
      authController.showLoginAlertDialogue();
    }
  }
}
