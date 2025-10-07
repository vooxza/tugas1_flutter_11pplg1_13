import 'package:flutter/material.dart';
import 'package:flutter_testing_1/controllers/example_controller.dart';
import 'package:get/get.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  // nanti inject di binding
  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // detection width
          controller.updateLayout(constraints);
          return Obx(()=>
            controller.isMobile.value
              ? const Center(child: Text("Example Mobile"))
              : const Center(child: Text("Example Widescreen"))
          );
        },
      )
    );
  }
}