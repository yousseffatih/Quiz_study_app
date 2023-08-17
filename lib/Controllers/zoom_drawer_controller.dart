import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void singOut() {}

  void singIn() {}

  void website() {}

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: "Youssef",
      path: "yousseffatih.Dev@gmail.com",
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw "could not launch $url";
    }
  }
}
