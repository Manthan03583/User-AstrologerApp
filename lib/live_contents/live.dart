import 'package:astrology_app/screens/home_page.dart';
import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all_astro_list.dart';
import 'category.dart';
import 'economical_astro.dart';
import 'new_astrologer.dart';
import 'trending_astrologer.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children:[ 
            SingleChildScrollView(
            padding: EdgeInsets.only(bottom: width * 0.18, top: width * 0.11),
            child: Padding(
              padding: EdgeInsets.fromLTRB(width * 0.015, width * 0.015, width * 0.015, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [              
                  SizedBox(
                    height: width * 0.06,
                  ),
                  Container(
                    //color: Colors.amber,
                    height: height * 0.23,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                      child: const AstroCategory(),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.005,
                  ),
                  //..............Trending Astrologer................//
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: width * 0.01, left: width * 0.02),
                      child: Text(
                        "Trending Astrologer",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.042),
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    height: height * 0.20,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.005),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.008, vertical: width * 0.008),
                      child: const TrendingAstrologer(),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.006,
                  ),
                  //..............New Astrologer................//
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: width * 0.01, left: width * 0.02),
                      child: Text(
                        "New Astrologer",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.042),
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    height: height * 0.20,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.005),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.008, vertical: width * 0.008),
                      child: const NewAstrologer(),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.005,
                  ),
                  //..............Economical Astrologer................//
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: width * 0.01, left: width * 0.02),
                      child: Text(
                        "Economical Astrologer",  
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.042),
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    height: height * 0.20,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.005),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.008, vertical: width * 0.008),
                      child: const EconomicalAstrologer(),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.005,
                  ),
                  //..............All Astrologer................//
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: width * 0.01, left: width * 0.02),
                      child: Text(
                        "All Astrologer",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.042),
                      ),
                    ),
                  ),
                  Container(
                    //height: 165,
                    height: height * 0.18,
                    width: width,
                    //color: Colors.amber,
                    margin: EdgeInsets.only(
                      left: width * 0.01,
                      right: width * 0.01,
                      top: height * 0.03,
                    ),
                    child: const AllAstrologerList(),
                  ),
                  SizedBox(
                    height: width * 0.03,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.1,
            right: width * 0.015,
            left: width * 0.015,
            child: Container(
              padding: EdgeInsets.only(top: width * 0.1, bottom: width * 0.01),
              color: Colors.black,
              child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: width * 0.08 ,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Text(
                          "Live",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500, color: textColor()),
                        ),
                      ],
                    ),
            ),)
          ]
        ),
      ),
    );
  }
}
