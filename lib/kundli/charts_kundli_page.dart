import 'package:astrology_app/kundli/nested_bar_page.dart';
//import 'package:astrology_app/screens/kundli/nested_bar_page.dart';
import 'package:flutter/material.dart';

import '../profile/user_all_calss.dart';

class ChartsKundliPage extends StatefulWidget {
  const ChartsKundliPage({super.key});

  @override
  State<ChartsKundliPage> createState() => _ChartsKundliPageState();
}

class _ChartsKundliPageState extends State<ChartsKundliPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //debugPrint(height.toString());
    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: width * 0.025),
          child: Column(
            children: [
              const KPage(text: 'Lagna '),
              SizedBox(
                height: width * 0.035,
              ),
              Image.asset(
                'assets/images/charts.png',
                width: width * 0.99,
              ),
              SizedBox(
                height: width * 0.025,
              ),
              const KPage(text: 'Planets'),
              SizedBox(
                height: width * 0.025,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: DataTable(
                  columnSpacing: width * 0.048,
                  border: TableBorder.all(
                      width: 1,
                      color: Colors.white,
                      style: BorderStyle.solid,
                      borderRadius: BorderRadius.circular(15)),
                  headingRowColor: MaterialStateProperty.all(Colors.blue),
                  headingTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.032,
                  ),
                  columns: const [
                    DataColumn(label: Text('Planet', textAlign: TextAlign.center)),
                    DataColumn(
                      label: Text('Sign', textAlign: TextAlign.center),
                    ),
                    DataColumn(
                      label: Text('Sign Lord', textAlign: TextAlign.center),
                    ),
                    DataColumn(
                      label: Text('Degree', textAlign: TextAlign.center),
                    ),
                    DataColumn(
                      label: Text('House', textAlign: TextAlign.center),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Ascendant',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027),
                        ),
                      )),
                      DataCell(Text('Taurus',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Sa',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('19  1\'53',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('1',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Moon',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Capricorn',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Ve',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('19  1\'53',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('9',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      //DataCell(Text('9')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Mars',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Taurus',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Sa',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('19  1\'53',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('1',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      //DataCell(Text('8')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Rahu',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Scorpio',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Ma',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('19  1\'53',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('9',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      //DataCell(Text('8')),
                    ]),
                    DataRow(cells: [
                      DataCell(
                          Text('Jupiter',
                          textAlign: TextAlign.center,
                           style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Libra',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Ve',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('19  1\'53',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('9',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      //DataCell(Text('8')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Saturn',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Aquarius',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('Sa',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('19  1\'53',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      DataCell(Text('6',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: width * 0.027))),
                      //DataCell(Text('8')),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: width * 0.035,
              ),
              const KPage(text: 'Understanding Your Kundli'),
              SizedBox(
                
                height: height * 1.9,
                child: const ChatTbPage(),
              ),
              //const ChatTbPage()
              // const SizedBox(height: 20,)
            ],
          ),
        ),
      );
  }
}
