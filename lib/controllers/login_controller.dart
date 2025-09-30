import 'package:flutter/material.dart';
import 'package:flutter_testing_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  
  
  login() async {
    if (username.text == 'admin' && password.text == 'admin') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username.text);
      await prefs.setString('password', password.text);
      Get.offAllNamed(AppRoutes.homepage);
    } else {
      Get.snackbar("Error", "Username atau Password salah");
    }
  }
}

