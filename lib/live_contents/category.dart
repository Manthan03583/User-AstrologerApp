import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/properties.dart';

class AstroCategory extends StatefulWidget {
  const AstroCategory({super.key});

  @override
  State<AstroCategory> createState() => _AstroCategoryState();
}

class _AstroCategoryState extends State<AstroCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        //height: MediaQuery.of(context).size.height,
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: astroCat.length,
                physics: const BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) => AstroCatContent(
                    image: astroCat[index].image,
                    title: astroCat[index].title))),
      ),
    );
  }
}

class AstroCat {
  late final String image, title;

  AstroCat({
    required this.image,
    required this.title,
  });
}

final List<AstroCat> astroCat = [
  AstroCat(
    image: "assets/images/categoryIcons/trending.png",
    title: "Trending",
  ),
  AstroCat(
    image: "assets/images/categoryIcons/new.png",
    title: "New",
  ),
  AstroCat(
    image: "assets/images/categoryIcons/economy.png",
    title: "Economy",
  ),
  AstroCat(
    image: "assets/images/categoryIcons/tarot_card.png",
    title: "Tarot Card",
  ),
  AstroCat(
    image: "assets/images/categoryIcons/vedic.png",
    title: "Vedic",
  ),
];

class AstroCatContent extends StatelessWidget {
  const AstroCatContent({super.key, required this.image, required this.title});

  final String image, title;

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Container(
            height: width * 0.2,
            width: width * 0.3,
            padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: width * 0.02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.3),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.5)
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: width * 0.015),
                  child: Image.asset(
                    image,
                    height: width * 0.08,
                    width: width * 0.08,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: width * 0.015),
                  child: SizedBox(
                    //height: 30,
                    child: Text(title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(
                            color: textColor(),
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
