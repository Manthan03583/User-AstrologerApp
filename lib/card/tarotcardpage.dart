import 'package:astrology_app/card/tarot_card.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:share_plus/share_plus.dart';

class TarotcardPage extends StatefulWidget {
  const TarotcardPage({super.key});

  @override
  State<TarotcardPage> createState() => _TarotcardPageState();
}

class _TarotcardPageState extends State<TarotcardPage> {
  final imageList = [
    'assets/images/sun.png',
    'assets/images/moon_card.png',
    'assets/images/star.png',
  ];

  final imageTextList = [
    'Sun',
    'Moon',
    'Star',
  ];
  late int selectedImageIndex;

  @override
  void initState() {
    super.initState();

    selectedImageIndex = imageList.length ~/ 2;
  }

  var padding = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HadLineP(text: 'Tarot card'),
                IconButton(
                  onPressed: () {
                    Share.share('com.example.astrology_app');
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    child: Column(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          imageTextList[selectedImageIndex],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'You have chosen ${imageTextList[selectedImageIndex]}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
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
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.asset(
      imageList[index],
      fit: BoxFit.cover,
    );
  }
}
