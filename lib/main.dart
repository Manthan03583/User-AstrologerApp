import 'package:astrology_app/controllers/network_Controller.dart';
import 'package:astrology_app/dependencies/dependency_injection.dart';
import 'package:astrology_app/controllers/services.dart';
import 'package:astrology_app/onboarding/splash_screen.dart';
//import 'package:astrology_app/kundli-matching/matching-openKundli.dart';
//import 'package:astrology_app/kundli-matching/newmatch.dart';
//import 'package:astrology_app/kundli/kundli_page.dart';
//import 'package:astrology_app/onboarding/about_us_screen.dart';
//import 'package:astrology_app/onboarding/newsplash_screen.dart';
import 'package:astrology_app/screens/home_page.dart';
import 'package:astrology_app/utils/routes.dart';
//import 'package:astrology_app/zodiac/zodiac_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 2),
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Jyotishbani App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
    );
  }
}
