import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_testing_1/controllers/football_controller.dart';
import 'package:flutter_testing_1/routes/routes.dart';

class FootballPage extends StatelessWidget {
  // final FootballController footballController = Get.put(FootballController());
  final footballController = Get.find<FootballController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: footballController.players.length,
          itemBuilder: (context, index) {
            var player = footballController.players[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(player.profileImage),
              ),
              title: Text(player.name),
              subtitle: Text("${player.position} • #${player.number}"),
              onTap: () {
                Get.toNamed(
                  AppRoutes.footballeditplayers,
                  arguments: index,
                  
                );
              },
            );
          },
        ),
      ),
    );
  }
}
