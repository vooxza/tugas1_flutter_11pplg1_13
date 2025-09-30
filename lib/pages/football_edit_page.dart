import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/football_controller_edit.dart';
import 'package:get/get.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  // final FootballEditController footballEditController = Get.put(FootballEditController());
  final footballEditController = Get.find<FootballEditController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Player")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: footballEditController.imageController,
              decoration: const InputDecoration(labelText: "Profile Image URL"),
            ),
            TextField(
              controller: footballEditController.nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: footballEditController.positionController,
              decoration: const InputDecoration(labelText: "Position"),
            ),
            TextField(
              controller: footballEditController.numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Number"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                footballEditController.updatePlayer();
                Get.back();
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
