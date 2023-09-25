import 'package:flutter/material.dart';

import '../profile/user_all_calss.dart';

class BasicsKundliPage extends StatefulWidget {
  const BasicsKundliPage({super.key});

  @override
  State<BasicsKundliPage> createState() => _BasicsKundliPageState();
}

class _BasicsKundliPageState extends State<BasicsKundliPage> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            const KPage(text: 'Basic Details'),
            SizedBox(
              height: width * 0.03,
            ),
            Container(
              height: height * 0.14,
              width: width * 0.90,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05, right:  width * 0.06, top:  width * 0.04, bottom:  width * 0.04),
                child: Table(
                  children: const [
                    TableRow(
                      children: [
                        Text("Name ", style: TextStyle(color: Colors.white)),
                        Text("Dev", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Date ", style: TextStyle(color: Colors.white)),
                        Text("23 January 1994",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Time ", style: TextStyle(color: Colors.white)),
                        Text("8:16  AM", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Time ", style: TextStyle(color: Colors.white)),
                        Text("8:16  AM", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Time ", style: TextStyle(color: Colors.white)),
                        Text("8:16  AM", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: width * 0.025,
            ),
            const KPage(text: 'Manglik Analysis'),
            SizedBox(
              height: width * 0.025,
            ),
            Container(
              height: height * 0.10,
              width: width * 0.90,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(width * 0.025),
                child: Row(
                  children: [
                    Container(
                      height: height * 0.06,
                      width: height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.white, fontSize: width * 0.04),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text(
                      'Since mars is in ninth house and in \ncapricorn sign person is Non Manglik.',
                      style: TextStyle(color: Colors.white, fontSize: width * 0.034),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: width * 0.025,
            ),
            const KPage(text: 'Panchang Details'),
            SizedBox(
              height: width * 0.025,
            ),
            Container(
              height: height * 0.10,
              width: width * 0.90,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05, right:  width * 0.06, top:  width * 0.04, bottom:  width * 0.04),
                child: Table(
                  children: const [
                    TableRow(
                      children: [
                        Text("Tithi ", style: TextStyle(color: Colors.white)),
                        Text("ShuklaEkadashi",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Karan ", style: TextStyle(color: Colors.white)),
                        Text("Vishti", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Yog ", style: TextStyle(color: Colors.white)),
                        Text("Brahma", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: width * 0.025,
            ),
            const KPage(text: 'Panchang Details'),
            SizedBox(
              height: width * 0.025,
            ),
            Container(
              height: height * 0.20,
              width: width * 0.90,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05, right:  width * 0.06, top:  width * 0.04, bottom:  width * 0.04),
                child: Table(
                  children: const [
                    TableRow(
                      children: [
                        Text("Varna ", style: TextStyle(color: Colors.white)),
                        Text("Shudra", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Vashya", style: TextStyle(color: Colors.white)),
                        Text("Chatushpada",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Yoni", style: TextStyle(color: Colors.white)),
                        Text("Sarpa", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Gan", style: TextStyle(color: Colors.white)),
                        Text("Manav", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Nadi", style: TextStyle(color: Colors.white)),
                        Text("Antya", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Sign", style: TextStyle(color: Colors.white)),
                        Text("Taurus", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Sign Lord",
                            style: TextStyle(color: Colors.white)),
                        Text("Venus", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
