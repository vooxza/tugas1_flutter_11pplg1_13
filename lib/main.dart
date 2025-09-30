import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_testing_1/routes/pages.dart';
import 'package:flutter_testing_1/routes/routes.dart';
import 'package:flutter_testing_1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashscreen, 
      getPages: AppPages.pages
    );
  }
}
