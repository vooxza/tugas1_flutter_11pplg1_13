import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/profile_controller.dart';
import 'package:flutter_testing_1/widgets/widget_button.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Fabian Amadeus S.N",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Flutter Developer",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),

            CustomButton(
              text: "Log Out",
              textColor: Colors.red,
              onPressed: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
