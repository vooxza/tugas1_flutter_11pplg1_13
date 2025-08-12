import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/football_controller.dart';
import 'package:flutter_testing_1/pages/football_edit_page.dart';
import 'package:get/get.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});
  final FootballController footballController = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Football Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(
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
                  Get.snackbar("Item clicked", player.name);
                  Get.to(() => FootballEditPage(
                        playerIndex: index,
                        player: player,
                      ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
