import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String angka1 = '';
  String angka2 = '';
  String hasil = '';

  void hitung(String operator) {
    if (angka1.isEmpty || angka2.isEmpty) {
      setState(() {
        hasil = 'Mohon isi kedua angka';
      });
      return;
    }

    final double a1 = double.parse(angka1);
    final double a2 = double.parse(angka2);
    double total;

    switch (operator) {
      case '+':
        total = a1 + a2;
        break;
      case '-':
        total = a1 - a2;
        break;
      case '*':
        total = a1 * a2;
        break;
      case '/':
        if (a2 == 0) {
          hasil = 'Tidak bisa dibagi 0';
          setState(() {});
          return;
        }
        total = a1 / a2;
        break;
      default:
        total = 0;
    }

    setState(() {
      hasil = 'Hasil: $total';
    });
  }

  void reset() {
    setState(() {
      angka1 = '';
      angka2 = '';
      hasil = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: 'Angka 1'),
              onChanged: (value) {
                setState(() {
                  angka1 = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: 'Angka 2'),
              onChanged: (value) {
                setState(() {
                  angka2 = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => hitung('+'), child: const Text('+')),
                ElevatedButton(onPressed: () => hitung('-'), child: const Text('-')),
                ElevatedButton(onPressed: () => hitung('*'), child: const Text('*')),
                ElevatedButton(onPressed: () => hitung('/'), child: const Text('/')),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              hasil,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: reset,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
