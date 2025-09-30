import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/login_controller.dart';
import 'package:flutter_testing_1/register.dart';
import 'package:flutter_testing_1/widgets/widget_button.dart';
import 'package:get/get.dart';

class LoginPage1 extends StatelessWidget {
  LoginPage1({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to our first app",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Center(
                child: Image.asset(
                  'assets/logo_flutter.png',
                  width: 100,
                  height: 100,
                ),
              ),

              const SizedBox(height: 10),
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

              const SizedBox(height: 10),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.login(); 
                  },
                  child: const Text("Login"),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: CustomButton(
                  text: "Register",
                  textColor: Colors.black,
                  onPressed: () {
                    print("Ini Register");
                  },
                ),
              ),

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
      ),
    );
  }
}
