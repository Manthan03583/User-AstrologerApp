import 'dart:async';
import 'package:astrology_app/controllers/aboutyourself_controller.dart';
import 'package:astrology_app/controllers/auth_controller.dart';
import 'package:astrology_app/controllers/profile_controllers.dart';
import 'package:astrology_app/controllers/splash_controller.dart';
import 'package:astrology_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplassPage extends StatefulWidget {
  const SplassPage({super.key});

  @override
  State<SplassPage> createState() => _SplassPageState();
}

class _SplassPageState extends State<SplassPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        if (!Get.find<SplashController>().isSplashSeen()) {
          Get.offAllNamed(Routes.onBoardScreen);
        } else {
          if (!await Get.find<AuthController>().getIsLogin()) {
            Get.offAllNamed(Routes.signIn);
          } else {
            await Get.find<ProfileController>().checkProfile();
            if (!await Get.find<AboutYourSelfController>()
                .getIsUserFilledDetails()) {
              Get.offNamed(Routes.tellusScreen,arguments: "from splash");
            } else {
              Get.offAllNamed(Routes.home);
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: child,
            );
          },
          child: Container(
              margin: const EdgeInsets.only(right: 25, left: 25),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/splash/splashlogo.png',
                      height: MediaQuery.of(context).size.height * 0.90,
                      width: MediaQuery.of(context).size.width * 0.90,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
