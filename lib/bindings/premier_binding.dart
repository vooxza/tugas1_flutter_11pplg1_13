import 'package:flutter_testing_1/controllers/contact_controller.dart';
import 'package:flutter_testing_1/controllers/premier_table_controller.dart';
import 'package:get/get.dart';

class PremierBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PremierTableController());
  }
}
