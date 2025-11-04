import 'dart:convert';

import 'package:flutter_testing_1/models/table_models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PremierTableController extends GetxController {
  var isLoading = false.obs;
  var standings = <Table>[].obs;
 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPremierTable();
  }
  
void fetchPremierTable() async {
    const url = 'https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026'; 
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      print("status code: ${response.statusCode}");
      print("json response: ${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List standingData = data['table'];
        standings.assignAll(standingData.map((e) => Table.fromJson(e)).toList());
        // mengisi variabel standings dari data model standingData (JSON)
      } else {
        Get.snackbar("failed", "failed to load data");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  } 
}