import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/calculator_controller.dart';
import 'package:flutter_testing_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_testing_1/widgets/widget_button.dart';
import 'package:flutter_testing_1/widgets/widget_textfield.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final controller = Get.find<CalculatorController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Calculator"),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyTextField(textEditingController: controller.txtAngka1, labelText: "input angka 1"),
            MyTextField(textEditingController: controller.txtAngka2, labelText: "input angka 2"),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomButton(text: "+", textColor: Colors.blue, onPressed: () {
                    controller.tambah();
                  },),
                  CustomButton(text: "-", textColor: Colors.blue, onPressed: () {
                    controller.kurang();
                  },),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomButton(text: "X", textColor: Colors.blue, onPressed: () {
                    controller.kali();
                  },),
                  CustomButton(text: "/", textColor: Colors.blue, onPressed: () {
                    controller.bagi();
                  },),
                ],
              ),
            ),
            Obx(() => Text("Hasil "+controller.hasilJumlah.value)),
            CustomButton(text: "Clear", textColor: Colors.green, onPressed: () {
              controller.clear();
            }, ),
            CustomButton(text: "Move to football players", textColor: Colors.blue, onPressed: () {
              Get.offAllNamed(AppRoutes.footballplayers);
            }, )       
          ],
        ),
      ),
    );
  }
}