import 'package:flutter/material.dart';

class ProfilFragment extends StatelessWidget {
  const ProfilFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Fragment")),
      body: const Center(
        child: Text("Ini adalah Profil Fragment"),
      ),
    );
  }
}