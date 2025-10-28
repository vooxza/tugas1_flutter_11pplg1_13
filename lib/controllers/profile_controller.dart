import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_testing_1/routes/routes.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove('token');
      await prefs.clear();

      print("🧹 Token setelah logout: ${prefs.getString('token')}");

      Get.snackbar(
        "Logout Berhasil",
        "Kamu telah keluar dari akun.",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );

      Get.offAllNamed(AppRoutes.splashscreen);
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
