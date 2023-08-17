import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_study_app/Screens/Home/home_Screen.dart';
import 'package:quiz_study_app/Screens/Login/login_screen.dart';
import 'package:quiz_study_app/firebase_ref/references.dart';

import '../firebase_options.dart';
import '../widgets/dialogs/dialoge_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth auth;
  final user = Rxn<User>();
  late Stream<User?> authStateChange;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    auth = FirebaseAuth.instance;
    authStateChange = auth.authStateChanges();
    authStateChange.listen(
      (User? useer) {
        user.value = useer;
      },
    );
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    Get.offAllNamed('/introduction');
  }

  void navigatHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.quetionStartDialogue(onTap: () {
      Get.back();
      navigatHomePage();
    }), barrierDismissible: false);
  }

  navigatToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  User? getUser() {
    user.value = auth.currentUser;
    return user.value;
  }

  Future<void> singOut() async {
    try {
      await auth.signOut();
      navigatToLoginPage();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  singInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken,
        );
        await auth.signInWithCredential(credential);
        await saveUser(account);
        navigatHomePage();
      }
    } on Exception catch (err) {
      // applogger.e(err);
      print("error : $err");
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRf.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profielpic": account.photoUrl
    });
  }
}
