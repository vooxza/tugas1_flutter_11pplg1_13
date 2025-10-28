import 'package:flutter_testing_1/controllers/loginapi_controller.dart';
import 'package:get/get.dart';

class LoginBindingApi extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }

}