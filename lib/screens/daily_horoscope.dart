//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/properties.dart';
//import 'horoscope/horoscope_screen.dart';

class DailyHoroscope extends StatefulWidget {
  const DailyHoroscope({super.key});

  @override
  State<DailyHoroscope> createState() => _DailyHoroscopeState();
}

class _DailyHoroscopeState extends State<DailyHoroscope> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
                physics: const BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                itemCount: horoscopeCategory.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // mainAxisSpacing: 5,
                  // crossAxisSpacing: 10,
                  // childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        // log(" val " + index.toString());
                      },
                      child: HoroscopeContent(
                          image: horoscopeCategory[index].image,
                          title: horoscopeCategory[index].title),
                    ))),
      ),
    );
  }
}

class Horoscope {
  late final String image, title;

  Horoscope({
    required this.image,
    required this.title,
  });
}

final List<Horoscope> horoscopeCategory = [
  Horoscope(
    image: "assets/images/group11.png",
    title: "Aries",
  ),
  Horoscope(
    image: "assets/images/group22.png",
    title: "Taurus",
  ),
  Horoscope(
    image: "assets/images/group12.png",
    title: "Virgo",
  ),
  Horoscope(
    image: "assets/images/group14.png",
    title: "Cancer",
  ),
  Horoscope(
    image: "assets/images/group15.png",
    title: "Leo",
  ),
  Horoscope(
    image: "assets/images/group13.png",
    title: "Gemini",
  ),
  Horoscope(
    image: "assets/images/group16.png",
    title: "Libra",
  ),
  Horoscope(
    image: "assets/images/group18.png",
    title: "Scorpion",
  ),
  Horoscope(
    image: "assets/images/group17.png",
    title: "Sagittarius",
  ),
  Horoscope(
    image: "assets/images/group19.png",
    title: "Capricorn",
  ),
  Horoscope(
    image: "assets/images/group21.png",
    title: "Aquarius",
  ),
  Horoscope(
    image: "assets/images/group20.png",
    title: "Pisces",
  ),
];

class HoroscopeContent extends StatelessWidget {
  const HoroscopeContent({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height * 0.006),
            child: Image.asset(
              image,
              height: height * 0.08,
              width: height * 0.08,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.006),
            child: SizedBox(
              height: height * 0.04,
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(color: textColor(), fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}
