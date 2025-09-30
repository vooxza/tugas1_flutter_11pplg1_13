import 'package:flutter_testing_1/controllers/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatorController>(()=> CalculatorController());
  }
}
