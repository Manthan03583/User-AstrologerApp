import 'dart:ui';
import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var height = 120.0;
    // var width = 100.0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //.............chat.......................//
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Container(
                  width: width * 0.27,
                  height: height * 0.145,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.6),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.4),
                            Colors.transparent.withOpacity(0.5)
                          ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/chat_bubbles.png",
                        //images[index].toString(),
                        height: height * 0.076,
                        width: height * 0.076,
                      ),
                      SizedBox(
                        height: height * 0.012,
                      ),
                      Text(
                        "Chat with",
                        //textList[index].toString(),
                        style: GoogleFonts.aBeeZee(
                            color: textColor(), fontSize: 12),
                      ),
                      Text(
                        "Astrologer",
                        //textList[index].toString(),
                        style: GoogleFonts.aBeeZee(
                            color: textColor(), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //.............call................//
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Container(
                  width: width * 0.27,
                  height: height * 0.145,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.6),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.4),
                            Colors.transparent.withOpacity(0.5)
                          ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/call.png",
                        //images[index].toString(),
                        height: height * 0.076,
                        width: height * 0.076,
                      ),
                      SizedBox(
                        height: height * 0.012,
                      ),
                      Text(
                        "Talk with",
                        //textList[index].toString(),
                        style: GoogleFonts.aBeeZee(
                            color: textColor(), fontSize: 12),
                      ),
                      Text(
                        "Astrologer",
                        //textList[index].toString(),
                        style: GoogleFonts.aBeeZee(
                            color: textColor(), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //.............video call................//
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Container(
                  width: width * 0.27,
                  height: height * 0.145,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.6),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.4),
                            Colors.transparent.withOpacity(0.5)
                          ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/video_camera.png",
                        //images[index].toString(),
                        height: height * 0.076,
                        width: height * 0.076,
                      ),
                      SizedBox(
                        height: height * 0.012,
                      ),
                      Text(
                        "Live sessions",
                        //textList[index].toString(),
                        style: GoogleFonts.aBeeZee(
                            color: textColor(), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //  })
      // )
      // ),
    );
  }
}
