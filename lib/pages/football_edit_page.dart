import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/football_controller.dart';
import 'package:flutter_testing_1/models/football_models.dart';
import 'package:get/get.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final FootballController footballController = Get.find();

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map;
    final int playerIndex = arguments['index'];
    final Player player = arguments['player'];

    final TextEditingController nameController =
        TextEditingController(text: player.name);
    final TextEditingController positionController =
        TextEditingController(text: player.position);
    final TextEditingController numberController =
        TextEditingController(text: player.number.toString());
    final TextEditingController imageController =
        TextEditingController(text: player.profileImage);

    return Scaffold(
      appBar: AppBar(title: Text("Edit Player")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: "Profile Image URL"),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: positionController,
              decoration: InputDecoration(labelText: "Position"),
            ),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                footballController.updatePlayer(
                  playerIndex,
                  Player(
                    profileImage: imageController.text,
                    name: nameController.text,
                    position: positionController.text,
                    number: int.tryParse(numberController.text) ?? 0,
                  ),
                );
                Get.back();
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
