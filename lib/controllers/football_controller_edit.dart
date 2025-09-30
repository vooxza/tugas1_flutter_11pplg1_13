import 'package:flutter_testing_1/controllers/football_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_testing_1/models/football_models.dart';
import 'package:flutter/material.dart';

class FootballEditController extends GetxController {
  late int index;
  late FootballController footballController;

  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final numberController = TextEditingController();
  final imageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments is Map) {
      index = (Get.arguments as Map<String, dynamic>)["index"];
    } else {
      index = Get.arguments as int;
    }

    footballController = Get.find<FootballController>();

    var player = footballController.players[index];
    print("Silahkan edit data $index → ${player.name}");

    nameController.text = player.name;
    positionController.text = player.position;
    numberController.text = player.number.toString();
    imageController.text = player.profileImage;
  }

  void updatePlayer() {
    final updatedPlayer = Player(
      profileImage: imageController.text,
      name: nameController.text,
      position: positionController.text,
      number: int.tryParse(numberController.text) ?? 0,
    );

    footballController.updatePlayer(index, updatedPlayer);
  }

  @override
  void onClose() {
    nameController.dispose();
    positionController.dispose();
    numberController.dispose();
    imageController.dispose();
    super.onClose();
  }
}
