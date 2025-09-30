import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Fragment")),
      body: const Center(
        child: Text("Ini adalah Home Fragment"),
      ),
    );
  }
}
