import 'package:flutter/material.dart';
import 'package:flutter_testing_1/pages/home_page.dart';
import 'package:flutter_testing_1/pages/main_menu_page.dart';
import 'package:get/get.dart';
import '../controllers/loginapi_controller.dart';
import '../pages/football_page.dart'; 
import '../register.dart';
import '../widgets/widget_button.dart';

class LoginApiPage extends StatelessWidget {
  LoginApiPage({super.key});

  final LoginApiController controller = Get.put(LoginApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login API Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to our first app",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/logo_flutter.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Please enter your username and password"),
            const SizedBox(height: 10),

            TextField(
              controller: controller.username,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: controller.password,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 45),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          await controller.login();

                          if (controller.loginStatus.value
                              .toLowerCase()
                              .contains("success")) {
                            Get.offAll(() => HomePage());
                          }
                        },
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text("Login"),
                );
              }),
            ),

            const SizedBox(height: 16),

            Obx(() => Center(
                  child: Text(
                    controller.loginStatus.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                )),
            const SizedBox(height: 16),

            Center(
              child: CustomButton(
                text: "Register",
                textColor: Colors.black,
                onPressed: () {
                  Get.to(() => RegisterPage());
                },
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: TextButton(
                onPressed: () {
                  Get.to(() => RegisterPage());
                },
                child: const Text("Belum punya akun? Register di sini"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
