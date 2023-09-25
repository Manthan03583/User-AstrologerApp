import 'dart:async';
import 'dart:developer';
import 'package:astrology_app/screens/blog.dart';
import 'package:astrology_app/screens/daily_tarot.dart';
import 'package:astrology_app/screens/stories/profile_stories.dart';
import 'package:astrology_app/screens/user_blog/blog_page.dart';
import 'package:astrology_app/screens/zodiacwheel/mergespin.dart';
import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:kbspinningwheel/kbspinningwheel.dart';
import '../constants/services.dart';
import '../utils/menu_content.dart';
import 'categories.dart';
import 'connect_screen.dart';
import 'daily_horoscope.dart';

class Dashboard extends StatefulWidget {
  //const Dashboard({super.key});

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //final GlobalKey<ScaffoldState> _key = GlobalKey();
  ServiceController serviceController = Get.find<ServiceController>();
  StreamController<int> controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // key: _key,
      drawer: drawerContent(),
      backgroundColor: Colors.black,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
            children: [
              SingleChildScrollView(
          padding: EdgeInsets.only(bottom: height * 0.08),
          child: 
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(                  
                      margin:  EdgeInsets.only(top: height * 0.05),
                      child: Column(
                        children: [
                          
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Center(
                            child: Text(
                              "Hello Dev",
                              style: GoogleFonts.aBeeZee(
                                  color: textColor(), fontSize: width * 0.038),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            "See what's on your fortune",
                            style: GoogleFonts.aBeeZee(
                                color: textColor(),
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold),
                          ),
                           SizedBox(
                            height: height * 0.015,
                          ),
                          Text(
                            "Your daily horoscope report",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: width * 0.036,
                            ),
                          ),
                          const MergeSpin(),
                        ],
                      ),
                    ),
                    //...........Gradient..........//
                    // Positioned(
                    //     bottom: 0,
                    //     child: Container(
                    //       width: width,
                    //       height: 100,
                    //       decoration: BoxDecoration(
                    //           gradient: LinearGradient(
                    //               begin: Alignment.topCenter,
                    //               end: Alignment.bottomCenter,
                    //               colors: [
                    //             Colors.transparent,
                    //             Colors.white.withOpacity(0.9)
                    //           ])),
                    //     )),
                  ],
                ),
                //....................Stories , Connect.....................//
                SizedBox(
                  width: width,
                  //color: Colors.white.withOpacity(0.9),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding:  EdgeInsets.only(left: height * 0.025, top: height * 0.016),
                          child: Text(
                            "Stories",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.047),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.017,
                      ),
                      SizedBox(
                        height: height * 0.125,
                       // margin:  EdgeInsets.only(left: height * 0.01, right: height * 0.015),
                        child: const ProfileStoriesList(),
                      ),
                      SizedBox(
                        height: height * 0.012,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: height * 0.025),
                          child: Text(
                            "Connect",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.047),
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.17 ,
                        // color: Colors.grey,
                        margin:
                             EdgeInsets.only(top: height * 0.015),
                        child: const ConnectScreen(),
                      ),
                    ],
                  ),
                ),
                //.................Categories..................//
                SizedBox(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: height * 0.025, bottom: height * 0.0125),
                          child: Text(
                            "Categories",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.047),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: height * 0.01),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12)),
                        //height: 245,
                        height: height * 0.31,
                        child: Padding(
                          padding: EdgeInsets.all(height * 0.003),
                          child: const CategoriesList(),
                        ),
                      ),
                    ],
                  ),
                ),
          
                //........................Daily Tarot.....................//
                SizedBox(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: height * 0.025, top: height * 0.02),
                          child: Text(
                            "Daily Tarot",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.047),
                          ),
                        ),
                      ),
                      Container(
                        //color: Colors.amber,
                        //height: 165,
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: EdgeInsets.only(top: height * 0.005),
                        //color: Colors.amber,
                        margin:
                           EdgeInsets.only(left: height * 0.012, right: height * 0.012, top: height * 0.012),
                        child: const DailyTarot(),
                      ),
                    ],
                  ),
                ),
                //........................Daily Horoscope.....................//
                SizedBox(
                  //color: Colors.amber.shade700,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: height * 0.025, top: height * 0.015),
                          child: Text(
                            "Daily Horoscope",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.047),
                          ),
                        ),
                      ),
                      Container(
                        //color: Colors.green,
                        //height: 500,
                        height: height * 0.57,
                        //color: Colors.amber,
                        margin:
                           EdgeInsets.only(left: height * 0.01, right: height * 0.01, top: height * 0.012),
                        child: const DailyHoroscope(),
                      ),
                    ],
                  ),
                ),
                //......................Blog.....................//
                SizedBox(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: height * 0.02, top: height * 0.013),
                            child: Row(
                              children: [
                                Text(
                                  "Blog",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.047),
                                ),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const BlogPage()));
                                    },
                                    child: const Text(
                                      'view all',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ))
                              ],
                            )),
                      ),
                      Container(
                        //height: 165,
                        height: MediaQuery.of(context).size.height * 0.23,
                        //color: Colors.amber,
                        margin:
                            EdgeInsets.only(left: height * 0.01, right: height * 0.01, top: height * 0.012),
                        child: const DashboardBlog(),
                      ),
                    ],
                  ),
                )
              ],
            ),
            ),
            Positioned(
              left: 0.1,
              top: 0.1,
              right: 0.1,
              //width: width,
              //height: height,
              child: Container(
                //height: height * 0.05, 
                color: Colors.black,
                // decoration: BoxDecoration(
                //   
                //   borderRadius: BorderRadius.circular(17)
                // ),
                padding: EdgeInsets.only(
                  left: height * 0.025,
                  right: height * 0.025,
                  top: height * 0.05,
                  bottom: height * 0.0005),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    // Obx(() {
                    //return
                    GestureDetector(
                      onTap: () {
                        serviceController.menuslide();
                        //opendrawer();
                        // ignore: unrelated_type_equality_checks
                        // serviceController.menuStatusValue == 0.obs
                        //     ? serviceController.menuStatusValue =
                        //         1.obs
                        //     : serviceController.menuStatusValue =
                        //         0.obs;
              
                        log("message ${serviceController.menuStatusValue}");
                      },
                      child: SizedBox(
                        height: height * 0.05,
                        //width: width * 0.1,
                        //color: Colors.amber,
                        child: Icon(
                          Icons.menu_outlined,
                          size: height * 0.03,
                          color: Colors.white,
                        ),
                      ),
                    ),
              
                    Row(
                      children: [
                        Center(
                          child: IconButton(
                            //alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(bottom: height * 0.002),
                            iconSize: height * 0.028,
                            onPressed: () {},
                            icon:  const Icon(
                              Icons.search_sharp,
                              //size: height * 0.03,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.005,
                        ),
                        GestureDetector(
                          onTap: (){
              
                          },
                          child: SizedBox(
                            height: height * 0.03,
                            width: height * 0.03,
                            //color: Colors.black,
                            child: Image.asset(
                              "assets/images/uil_language.png",
                            ),
                          ),
                        ),
                         SizedBox(
                          width: width * 0.014,
                        ),
                        SizedBox(
                          height: height * 0.03,
                          width: height * 0.03,
                          child: Image.asset(
                            "assets/images/notification.png",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
            ]
          
        ),
      ),
    );
  }

  Widget drawerContent() {
    return Container(
      color: Colors.grey[900],
      width: MediaQuery.of(context).size.width * 0.65,
      //height: MediaQuery.of(context).size.height * 0.90,
      height: double.infinity,
      child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Flexible(child: MenuContent())),
    );
  }

  void opendrawer() {
    // setState(() {
    //   // HomePage.val == 0 ? HomePage.val = 1 : HomePage.val = 0;
    // });
  }
}
