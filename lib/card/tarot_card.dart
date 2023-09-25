import 'package:astrology_app/palmistry/palmistry_report.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Tarotcard extends StatefulWidget {
  const Tarotcard({super.key});

  @override
  State<Tarotcard> createState() => _TarotcardState();
}

class _TarotcardState extends State<Tarotcard> {
  final imageList = [
    'assets/images/justice.png',
    'assets/images/death.png',
    'assets/images/world.png',
  ];

  final imageTextList = [
    'Justice',
    'Death',
    'World',
  ];
  late int selectedImageIndex;

  @override
  void initState() {
    super.initState();

    selectedImageIndex = imageList.length ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HadLineP(text: 'Tarot card'),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < imageList.length; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImageIndex = i;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                height: i == selectedImageIndex ? 200.0 : 145.0,
                                child: Image.asset(
                                  imageList[i],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PalmistryReport()));
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          imageTextList[selectedImageIndex],
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You have chosen ${imageTextList[selectedImageIndex]}',
                        style: const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your thorough and consistent effort thus far \nhas worn your out. Dedicate the day to put \nyour mind and body at rest, and reinvigorate \nyourself to prepare for the future events to \ncome.',
                        style: TextStyle(
                            color: Color.fromARGB(255, 137, 136, 136),
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your thorough and consistent effort thus far \nhas worn your out. Dedicate the day to put \nyour mind and body at rest, and reinvigorate \nyourself to prepare for the future events to \ncome.',
                        style: TextStyle(
                            color: Color.fromARGB(255, 137, 136, 136),
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your thorough and consistent effort thus far \nhas worn your out. Dedicate the day to put \nyour mind and body at rest, and reinvigorate \nyourself to prepare for the future events to \ncome.',
                        style: TextStyle(
                            color: Color.fromARGB(255, 137, 136, 136),
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
