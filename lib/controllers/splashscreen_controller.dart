import 'package:flutter_testing_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // cek if username is stored
    checkLogin();
  }
  checkLogin () async {
    await Future.delayed(const Duration(seconds: 5));
    final prefs = await SharedPreferences.getInstance();
    final saveUser = prefs.getString('username');

    if (saveUser != null) {
      Get.offAllNamed(AppRoutes.homepage);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
