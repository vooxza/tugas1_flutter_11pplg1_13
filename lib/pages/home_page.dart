import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/calculator_controller.dart';
import 'package:flutter_testing_1/controllers/football_controller.dart';
import 'package:flutter_testing_1/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_testing_1/controllers/bottom_nav_controller.dart';
import 'package:flutter_testing_1/pages/kalkulator_page.dart';
import 'package:flutter_testing_1/pages/football_page.dart';
import 'package:flutter_testing_1/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());
  final CalculatorController calculatorController = Get.put(CalculatorController());
  final FootballController footballController = Get.put(FootballController());
  final ProfileController profileController = Get.put(ProfileController());

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) => navController.changeTab(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Kalkulator"),
            BottomNavigationBarItem(icon: Icon(Icons.sports_soccer_rounded), label: "Football Players"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
