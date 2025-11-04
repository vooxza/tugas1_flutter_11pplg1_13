import 'package:flutter_testing_1/pages/login_api_page.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../pages/home_page.dart';

class GoogleController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var user = Rx<User?>(null);
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  var isSigningIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
    ever(user, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    // pastikan tidak double navigate
    if (Get.currentRoute == '/login' || Get.currentRoute == '/loginapi') {
      if (user != null) {
        Get.offAll(() => HomePage());
      }
    } else if (user == null) {
      Get.offAll(() => LoginApiPage());
    }
  }

  Future<void> signInWithGoogle() async {
    if (isSigningIn.value) return; // cegah klik dua kali
    isSigningIn.value = true;

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        isSigningIn.value = false;
        return; // user cancel
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);

      // Snackbar sukses
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      Get.snackbar("✅ Login Berhasil", "Selamat datang!",
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      Get.snackbar("❌ Login Gagal", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isSigningIn.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await auth.signOut();
      Get.snackbar("👋 Logout", "Kamu telah keluar dari akun.",
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar("❌ Logout Gagal", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
 