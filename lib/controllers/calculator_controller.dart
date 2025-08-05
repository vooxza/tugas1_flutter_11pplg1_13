import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final txtAngka1 = TextEditingController();
  final txtAngka2 = TextEditingController();
  var hasilJumlah = "".obs;

  void tambah() {
    int angka1 = int.tryParse(txtAngka1.text) ?? 0;
    int angka2 = int.tryParse(txtAngka2.text) ?? 0;
    int hasil = angka1 + angka2;

    print("hasil tambah = $hasil");

    hasilJumlah.value = hasil.toString(); 
  }
  void kurang() {
    int angka1 = int.tryParse(txtAngka1.text) ?? 0;
    int angka2 = int.tryParse(txtAngka2.text) ?? 0;
    int hasil = angka1 - angka2;

    print("hasil tambah = $hasil");

    hasilJumlah.value = hasil.toString(); 
  }
  void kali() {
    int angka1 = int.tryParse(txtAngka1.text) ?? 0;
    int angka2 = int.tryParse(txtAngka2.text) ?? 0;
    int hasil = angka1 * angka2;

    print("hasil tambah = $hasil");

    hasilJumlah.value = hasil.toString(); 
  }
  void bagi() {
    int angka1 = int.tryParse(txtAngka1.text) ?? 0;
    int angka2 = int.tryParse(txtAngka2.text) ?? 0;
    double hasil = angka1 / angka2;

    print("hasil tambah = $hasil");

    hasilJumlah.value = hasil.toString(); 
  }
  void clear(){
    txtAngka1.clear();
    txtAngka2.clear();
    hasilJumlah.value = "";
  }
}
