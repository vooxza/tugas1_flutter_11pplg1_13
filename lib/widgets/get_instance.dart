import 'package:get/get.dart';
import 'package:flutter_testing_1/controllers/football_controller.dart';

class GetInstance {
  static void init() {
    Get.put(FootballController(), permanent: true);

  }

  static FootballController get footballController => Get.find<FootballController>();
}
