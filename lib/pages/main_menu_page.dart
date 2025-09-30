import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/main_menu_controller.dart';
import 'package:flutter_testing_1/fragments/home_fragment.dart';
import 'package:flutter_testing_1/fragments/home_history_fragment.dart';
import 'package:flutter_testing_1/fragments/profil_fragment.dart';
import 'package:flutter_testing_1/kalkulator.dart';
import 'package:flutter_testing_1/pages/football_page.dart';
import 'package:flutter_testing_1/pages/kalkulator_page.dart';
import 'package:flutter_testing_1/pages/profile_page.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final MainMenuController mainMenuController = Get.put(MainMenuController());

  final List<Widget> pages = [HomeFragment(), HomeHistoryFragment(), ProfilFragment()];

   @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      appBar: AppBar(title: Text("Main Menu"),),
      body: pages[mainMenuController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(icon: Icon(Icons.add_home) , label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.lock_clock) , label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline) , label: "Profile"),
      ],
      currentIndex: mainMenuController.selectedIndex.value,
      onTap: mainMenuController.changePage,
      ),
    ));
  }
}
