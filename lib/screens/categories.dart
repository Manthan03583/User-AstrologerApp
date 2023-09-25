import 'package:astrology_app/card/tarotcardpage.dart';
import 'package:astrology_app/horoscope/horoscope_screen.dart';
import 'package:astrology_app/kundli-matching/matching-openKundli.dart';
import 'package:astrology_app/kundli/kundli_page.dart';
import 'package:astrology_app/palmistry/palmistry_page.dart';
import 'package:astrology_app/panchag-consultant/consultation.dart';
import 'package:astrology_app/panchag-consultant/panchang_page.dart';
import 'package:astrology_app/utils/properties.dart';
import 'package:astrology_app/zodiac/zodiac_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
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
                //shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                itemCount: cat.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () => tapped(index),
                      child: CategoryContent(
                          image: cat[index].image, title: cat[index].title),
                    ))),
      ),
    );
  }

  tapped(int index) {
    if (index == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HoroscopeScreen()));
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const KundliPage()));
    }
    else if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const KundliMainPage()));
    }
    else if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ZodiacTab()));
    }
    else if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PanchangPage()));
    }
    else if (index == 5) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TarotcardPage()));
    }
    else if (index == 6) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PalmistryPage()));
    }
    else if (index == 7) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Consultation()));
    }
  }
}

class Category {
  late final String image, title;

  Category({
    required this.image,
    required this.title,
  });
}

final List<Category> cat = [
  Category(
    image: "assets/images/categories/daily_horoscope.png",
    title: "Daily Horoscope",
  ),
  Category(
    image: "assets/images/categories/free_kundli.png",
    title: "Free Kundli",
  ),
  Category(
    image: "assets/images/categories/kundli_matching.png",
    title: "Kundli Matching",
  ),
  Category(
    image: "assets/images/categories/zodiac_match.png",
    title: "Zodiac Match",
  ),
  Category(
    image: "assets/images/categories/birth_chart.png",
    title: "Panchang",
  ),
  Category(
    image: "assets/images/categories/tarot.png",
    title: "Tarot Reading",
  ),
  Category(
    image: "assets/images/categories/palmistry.png",
    title: "Palmistry",
  ),
  Category(
    image: "assets/images/categories/consultation.png",
    title: "Consultation",
  ),
];

class CategoryContent extends StatelessWidget {
  const CategoryContent({
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
            padding: EdgeInsets.only(top: height * 0.006),
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
