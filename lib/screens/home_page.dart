import 'dart:math';
//import 'dart:developer';
import 'package:astrology_app/constants/services.dart';
//import 'package:astrology_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
//import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import '../utils/menu_content.dart';
import 'bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //static double val = 0;

  ServiceController serviceController = Get.find<ServiceController>();

  @override
  void initState() {
    super.initState();
    //  Obx(() => print("Value${serviceController.menuStatusValue}"));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 77, 24, 46),
              Color.fromARGB(255, 90, 77, 94),
              // Colors.pink[900],
              // Color.fromARGB(255, 133, 198, 230),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
        //.............Menu..............//
         SafeArea(
            minimum: EdgeInsets.only(left: height * 0.022),
            child: SizedBox(
              width: height * 0.25,
              child: const MenuContent(),
            )),
        Obx(() {
          //print("object ${serviceController.menuStatusValue.value}");
          return TweenAnimationBuilder(
              tween: Tween<double>(
                  begin: 0,
                  end: serviceController.menuStatusValue.value.toDouble()
                  // Get.find<ServiceController>().menuStatusValue.toDouble()
                  ),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..setEntry(0, 3, 200 * value)
                    ..rotateY((pi / 7) * value),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(0)),
                    child: BottomNav(),
                  ),
                );
              });
        })
      ]),
    );

    //   Scaffold(
    //     bottomNavigationBar: Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Container(
    //         child: FloatingNavbar(
    //           onTap: (int val) => setState(() => _index = val),
    //           currentIndex: _index,
    //           backgroundColor: Colors.black.withOpacity(1),
    //           itemBorderRadius: 0,
    //           selectedItemColor: Colors.blue,
    //           selectedBackgroundColor: Colors.transparent,
    //           unselectedItemColor: Colors.white,
    //           fontSize: 10,
    //           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //           items: [
    //             FloatingNavbarItem(icon: Icons.home, title: 'Home'),
    //             FloatingNavbarItem(icon: Icons.explore, title: 'Connect'),
    //             FloatingNavbarItem(
    //                 icon: Icons.chat_bubble_outline, title: 'Live'),
    //             //FloatingNavbarItem(icon: Icons.settings, title: 'Shop'),
    //             FloatingNavbarItem(icon: Icons.settings, title: 'History'),
    //           ],
    //         ),
    //       ),
    //     ),
    //     //If you want to show body behind the navbar, it should be true
    //     extendBody: true,
    //     body: bodyContainer(),
    //   );
    // }

    // Widget bodyContainer() {
    //   var pagesData = [
    //     const Dashboard(),
    //     const ConnectPage(),
    //     const LivePage(),
    //     const HistoryScreen(),
    //   ];
    //   return SizedBox(
    //     //color: Colors.amber,
    //     //width: double.infinity,
    //     //height: MediaQuery.of(context).size.height,
    //     //height: double.infinity,
    //     child: Center(child: pagesData.elementAt(_index)),
    //   );
    // }
  }
}
