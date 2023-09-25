import 'package:astrology_app/constants/dependency_injection.dart';
import 'package:astrology_app/constants/services.dart';
import 'package:astrology_app/onboarding/newsplash_screen.dart';
//import 'package:astrology_app/kundli-matching/matching-openKundli.dart';
//import 'package:astrology_app/kundli-matching/newmatch.dart';
//import 'package:astrology_app/kundli/kundli_page.dart';
//import 'package:astrology_app/onboarding/about_us_screen.dart';
//import 'package:astrology_app/onboarding/newsplash_screen.dart';
import 'package:astrology_app/screens/home_page.dart';
//import 'package:astrology_app/zodiac/zodiac_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplassPage(),
    );
  }
}
