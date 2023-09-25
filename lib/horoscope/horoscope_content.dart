import 'package:flutter/material.dart';
import '../../utils/properties.dart';
import 'monthly_horoscope.dart';

class HoroscopeContentScreen extends StatefulWidget {
  const HoroscopeContentScreen({super.key});

  @override
  State<HoroscopeContentScreen> createState() => _HoroscopeContentScreenState();
}

class _HoroscopeContentScreenState extends State<HoroscopeContentScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: width * 0.05, right: width * 0.025, left: width * 0.022),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your daily horoscope is ready!",
                        style: TextStyle(
                            color: textColor(), fontSize: width * 0.032),
                      ),
                      SizedBox(
                        height: width * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Lucky colors",
                                  style: TextStyle(
                                      color: textColor(),
                                      fontSize: width * 0.032)),
                              SizedBox(
                                height: width * 0.015,
                              ),
                              Icon(
                                Icons.circle,
                                color: Colors.pink,
                                size: width * 0.06,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text("Lucky Number",
                                  style: TextStyle(
                                      color: textColor(),
                                      fontSize: width * 0.032)),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text("06",
                                  style: TextStyle(
                                      color: textColor(),
                                      fontSize: width * 0.032)),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.035,
                          ),
                          Column(
                            children: [
                              Text("Mood of day",
                                  style: TextStyle(
                                      color: textColor(),
                                      fontSize: width * 0.032)),
                              SizedBox(
                                height: width * 0.015,
                              ),
                              Icon(
                                Icons.emoji_emotions_outlined,
                                color: Colors.amber,
                                size: width * 0.06,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text("Lucky Time",
                                  style: TextStyle(
                                      color: textColor(),
                                      fontSize: width * 0.032)),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text("06:11 PM",
                                  style: TextStyle(
                                      color: textColor(),
                                      fontSize: width * 0.032)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: width * 0.07,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //.........sunsign Image...................//
                      SizedBox(
                        height: height * 0.105,
                        width: height * 0.105,
                        child: Image.asset("assets/images/sunsigns/aries.png"),
                      ),
                      SizedBox(
                        height: width * 0.015,
                      ),
                      //.........sunsign name...................//
                      Text(
                        "Aries",
                        style: TextStyle(
                            color: textColor(), fontSize: width * 0.05),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: width * 0.025,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.045, right: width * 0.045),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daily Horoscope",
                    style: TextStyle(color: textColor(), fontSize: width * 0.05),
                  ),
                  SizedBox(
                        height: width * 0.025,
                      ),
                  //...................Love container........................//
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: width * 0.045,
                              ),
                              SizedBox(
                                width: width * 0.015,
                              ),
                              Text(
                                "Love",
                                style:
                                    TextStyle(color: textColor(), fontSize: width * 0.037),
                              ),
                              const Spacer(),
                              const Text(
                                "60%",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Text(
                            "Inject a bright beautiful and glorious picture in your mind to uplift your spirits. Finances improve later in the day.",
                            style: TextStyle(color: textColor()),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.035,
                  ),
                  //...................Career container........................//
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_bag,
                                color: Colors.yellow,
                                size: width * 0.045,
                              ),
                              SizedBox(
                                width: width * 0.015,
                              ),
                              Text(
                                "Career",
                                style:
                                    TextStyle(color: textColor(), fontSize: width * 0.037),
                              ),
                              const Spacer(),
                              const Text(
                                "80%",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Text(
                            "Inject a bright beautiful and glorious picture in your mind to uplift your spirits. Finances improve later in the day.",
                            style: TextStyle(color: textColor()),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.035,
                  ),
                  //...................Money container........................//
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.money_rounded,
                                color: Colors.green,
                                size: width * 0.045,
                              ),
                              SizedBox(
                                width: width * 0.015,
                              ),
                              Text(
                                "Money",
                                style:
                                    TextStyle(color: textColor(), fontSize: width * 0.037),
                              ),
                              const Spacer(),
                              const Text(
                                "40%",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Text(
                            "Inject a bright beautiful and glorious picture in your mind to uplift your spirits. Finances improve later in the day.",
                            style: TextStyle(color: textColor()),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.035,
                  ),                 
                  //...................Travel container........................//
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.flight,
                                color: Colors.grey,
                                size: width * 0.045,
                              ),
                              SizedBox(
                                width: width * 0.015,
                              ),
                              Text(
                                "Travel",
                                style:
                                    TextStyle(color: textColor(), fontSize: width * 0.037),
                              ),
                              const Spacer(),
                              const Text(
                                "40%",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Text(
                            "Inject a bright beautiful and glorious picture in your mind to uplift your spirits. Finances improve later in the day.",
                            style: TextStyle(color: textColor()),
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: width * 0.035,
                  // ), 
                  SizedBox(height: height * 0.25, child: const HoroscopeStudy()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
