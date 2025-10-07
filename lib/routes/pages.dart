import 'package:flutter/material.dart';
import 'package:flutter_testing_1/bindings/calculator_binding.dart';
import 'package:flutter_testing_1/bindings/contact_binding.dart';
import 'package:flutter_testing_1/bindings/example_binding.dart';
import 'package:flutter_testing_1/bindings/football_binding.dart';
import 'package:flutter_testing_1/bindings/football_edit_binding.dart';
import 'package:flutter_testing_1/bindings/login_binding.dart';
import 'package:flutter_testing_1/bindings/profile_binding.dart';
import 'package:flutter_testing_1/bindings/splashscreen_binding.dart';
import 'package:flutter_testing_1/fragments/home_fragment.dart';
import 'package:flutter_testing_1/fragments/home_history_fragment.dart';
import 'package:flutter_testing_1/fragments/profil_fragment.dart';
import 'package:flutter_testing_1/login.dart';
import 'package:flutter_testing_1/pages/contact_page.dart';
import 'package:flutter_testing_1/pages/example_page.dart';
import 'package:flutter_testing_1/pages/football_page.dart';
import 'package:flutter_testing_1/pages/home_page.dart';
import 'package:flutter_testing_1/pages/kalkulator_page.dart';
import 'package:flutter_testing_1/pages/football_edit_page.dart';
import 'package:flutter_testing_1/pages/login_page.dart';
import 'package:flutter_testing_1/pages/main_menu_page.dart';
import 'package:flutter_testing_1/pages/profile_page.dart';
import 'package:flutter_testing_1/pages/splashscreen_page.dart';
import 'package:flutter_testing_1/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  // list / array yang isinya kumpulan page kita
  static final pages = [
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: AppRoutes.footballplayers,
      page: () => FootballPage(),
      binding: FootballBinding(),
    ),
    GetPage(
      name: AppRoutes.footballeditplayers,
      page: () => FootballEditPage(),
      binding: FootballEditBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(name: AppRoutes.mainmenu, page: () => MainMenuPage()),
    GetPage(name: AppRoutes.homepage, page: () => HomePage()),
    GetPage(name: AppRoutes.homefragment, page: () => HomeFragment()),
    GetPage(name: AppRoutes.historyfragment, page: () => HomeHistoryFragment()),
    GetPage(name: AppRoutes.profilfragment, page: () => ProfilFragment()),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage1(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.contactpage,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.examplescreen,
      page: () => ExamplePage(),
      binding: ExampleBinding(),
    ),
  ];
}
