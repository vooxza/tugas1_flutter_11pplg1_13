import 'package:flutter/material.dart';

class HomeHistoryFragment extends StatelessWidget {
  const HomeHistoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History Fragment")),
      body: const Center(
        child: Text("Ini adalah History Fragment"),
      ),
    );
  }
}
