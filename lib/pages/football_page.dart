import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_testing_1/controllers/football_controller.dart';
import 'package:flutter_testing_1/routes/routes.dart';

class FootballPage extends StatelessWidget {
  final footballController = Get.find<FootballController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Football Players")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return Obx(() => isMobile
              ? ListView.builder(
                  itemCount: footballController.players.length,
                  itemBuilder: (context, index) {
                    var player = footballController.players[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(player.profileImage),
                      ),
                      title: Text(player.name),
                      subtitle: Text("${player.position} • #${player.number}"),
                      onTap: () => Get.toNamed(
                        AppRoutes.footballeditplayers,
                        arguments: index,
                      ),
                    );
                  },
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 600
                        ? 3   
                        : 2, 
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.4, 
                  ),
                  itemCount: footballController.players.length,
                  itemBuilder: (context, index) {
                    var player = footballController.players[index];
                    return InkWell(
                      onTap: () => Get.toNamed(
                        AppRoutes.footballeditplayers,
                        arguments: index,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40, 
                                backgroundImage:
                                    NetworkImage(player.profileImage),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      player.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${player.position} • #${player.number}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ));
        },
      ),
    );
  }
}
