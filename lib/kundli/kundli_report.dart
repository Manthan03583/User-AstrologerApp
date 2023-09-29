import 'package:astrology_app/kundli-matching/kundliclass.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:astrology_app/widgets/background_img.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class KundliReport extends StatelessWidget {
  const KundliReport({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HadLineP(text: 'Kundli Matching'),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 224, 142, 142),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Image.asset(
                  "assets/images/bg.png",
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                "Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const ReportCardComponent(
                heading: 'Compatibility (Varna)',
                description:
                    'Varna refers to the mental\ncompatibility of two persons\ninvolved. It holds nominal effect in the\nmatter of marriage compatibility',
                color: Color.fromARGB(255, 238, 217, 217),
                cpcolor: Color.fromARGB(255, 218, 131, 131),
                cptext: '0/1',
              ),
              const ReportCardComponent(
                heading: 'Love (Bhakut)',
                description:
                    "Bhakut is related to the couple's joys\nand sorrows together and assesses\nthe wealth and health after their\nwedding.",
                color: Color.fromARGB(255, 232, 230, 220),
                cpcolor: Color.fromARGB(255, 173, 157, 75),
                cptext: '7/7',
              ),
              const ReportCardComponent(
                heading: 'Mental Compatibility (Maitri)',
                description:
                    'Maitri assesses the mental\ncompatibility and mutual love\nbetween the partners to be married.',
                color: Color.fromARGB(255, 184, 200, 171),
                cpcolor: Color.fromARGB(255, 158, 229, 100),
                cptext: '0.5/5',
              ),
              const ReportCardComponent(
                heading: 'Health (Nadi)',
                description:
                    'Nadi is related to the health\ncompatibility of the couple. Matters\nof the child birth and progeny are also\ndetermined with these guna ',
                color: Color.fromARGB(255, 178, 204, 220),
                cpcolor: Color.fromARGB(255, 82, 164, 214),
                cptext: '8/8',
              ),
              const ReportCardComponent(
                heading: 'Dominance (Vashya)',
                description:
                    "Vashya indicates the bride and the\ngroom's tendency to dominate or\ninfluence each other in a marriage.",
                color: Color.fromARGB(255, 202, 181, 218),
                cpcolor: Color.fromARGB(255, 179, 132, 215),
                cptext: '1/2',
              ),
              const ReportCardComponent(
                heading: 'Temperament (Gana)',
                description:
                    'Gana is the indicator of the behavior,\nCharacter and temperament of the\npotential bride and groom towards\neach other. ',
                color: Color.fromARGB(255, 161, 195, 227),
                cpcolor: Color.fromARGB(255, 99, 163, 227),
                cptext: '1/6',
              ),
              const ReportCardComponent(
                heading: 'Destiny (Tara)',
                description:
                    "Tara is the indicator of the birth star\nof the compatibility of the bride and the\ngroom. It also indicates the fortune of\nthe couple.",
                color: Color.fromARGB(255, 231, 187, 204),
                cpcolor: Color.fromARGB(255, 210, 139, 172),
                cptext: '3/3',
              ),
              const ReportCardComponent(
                heading: 'Physical Compatibility (Yoni)',
                description:
                    'Yoni is the indicator of the sexual or\nthe physical compatibility between the\nbride and the groom in question.',
                color: Color.fromARGB(255, 105, 173, 130),
                cpcolor: Color.fromARGB(255, 26, 216, 105),
                cptext: '3/4',
              ),
              const Text(
                "Manglik Report",
                style: TextStyle(color: Colors.blueGrey, fontSize: 19),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const PartnerPicture(
                    image: 'assets/images/boykm.jpg',
                    manglik: 'Non Manglik',
                  ),
                  SizedBox(
                      height: 90,
                      width: 90,
                      child: Lottie.asset('assets/lottie/kma.json')),
                  const PartnerPicture(
                    image: 'assets/images/girlkm.jpg',
                    manglik: 'Non Manglik',
                  ),
                ],
              ),
              ConclusionAstro()
            ],
          ),
        ),
      ),
    );
  }
}
