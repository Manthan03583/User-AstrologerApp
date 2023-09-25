import 'package:flutter/material.dart';

import '../../utils/properties.dart';
import 'daily_horoscope.dart';
import 'horoscope_signs.dart';

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  State<HoroscopeScreen> createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        //width: height,
        height: height,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, width * 0.13, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: width * 0.075,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  Text(
                    " Daily Horoscope",
                    style: TextStyle(color: textColor(), fontSize: width * 0.05),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                //flex: 1,
                child: SizedBox(height: width * 0.18, child: const SunSignContent()),
              ),
              SizedBox(
                height: width * 0.03
              ),
               const Flexible(
                flex: 9,
                //height: height * .785,
                
                  child: DailyHoroscopeData()),
              
            ],
          ),
        ),
      ),
    );
  }
}
