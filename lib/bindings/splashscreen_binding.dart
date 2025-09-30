import 'package:flutter_testing_1/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(()=> SplashscreenController());
  }
}
