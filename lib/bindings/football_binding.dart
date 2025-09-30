import 'package:flutter_testing_1/controllers/football_controller.dart';
import 'package:get/get.dart';

class FootballBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FootballController>(()=> FootballController());
  }
}
