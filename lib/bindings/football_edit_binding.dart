import 'package:flutter_testing_1/controllers/football_controller_edit.dart';
import 'package:get/get.dart';

class FootballEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FootballEditController>(()=> FootballEditController());
  }
}
