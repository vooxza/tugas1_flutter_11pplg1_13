import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/premier_table_controller.dart';
import 'package:get/get.dart';

class PremierTablePage extends StatelessWidget {
  PremierTablePage({super.key});

  final controller = Get.find<PremierTableController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Premier League Page"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx((){
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());  
          }
        return RefreshIndicator(
          onRefresh: () {
            controller.fetchPremierTable();
            return Future.value();  
          },
          child: ListView.builder(
            itemCount: controller.standings.value.length,
            itemBuilder: (context, index) {
              final team = controller.standings[index];
              return Card(child: ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(team.strBadge),),
                trailing: Text("Points: " + team.intPoints.toString()),
                subtitle: Text("Played " + team.intPlayed.toString()+ " Win " + team.intWin.toString()+ " Draw " + team.intDraw.toString()+ " Loss " + team.intLoss.toString()),
                title: Text(team.strTeam.toString())),
              );
            }
          ),
        );
        }),
      ),
    );
  }
}
