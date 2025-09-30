import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

   final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Ini Splashscreen\nMemeriksa login...",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
