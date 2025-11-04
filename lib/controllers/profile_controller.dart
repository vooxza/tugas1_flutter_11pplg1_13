import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_testing_1/routes/routes.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // hapus token
      await _auth.signOut(); // logout dari Firebase juga

      Get.snackbar(
        "Logout Berhasil",
        "Kamu telah keluar dari akun.",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );

      // ✅ Langsung ke halaman login, bukan splash
      Get.offAllNamed(AppRoutes.loginapi);
    } catch (e) {
      Get.snackbar(
        "Logout Gagal",
        "Terjadi kesalahan: $e",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
