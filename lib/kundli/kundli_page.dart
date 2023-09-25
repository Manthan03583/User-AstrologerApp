import 'package:astrology_app/kundli/charts_kundli_page.dart';
//import 'package:astrology_app/screens/kundli/charts_kundli_page.dart';
import 'package:flutter/material.dart';

import '../profile/user_all_calss.dart';
import 'astakvarga.dart';
import 'basics_kundli_page.dart';
import 'dasha_kundli_page.dart';
import 'kp_kundli_Page.dart';
import 'nested_bar_page.dart';

class KundliPage extends StatefulWidget {
  const KundliPage({super.key});

  @override
  State<KundliPage> createState() => _KundliPageState();
}

class _KundliPageState extends State<KundliPage> with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const HadLineP(text: 'Kundli'),
                Container(
                  height: width * 0.09,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)),
                  child: TabBar(
                    controller: _controller,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    labelStyle: const TextStyle(fontSize: 14),
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    indicator: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: cat.map<Widget>((TabList tab) {
                      return Tab(
                        child: Text(tab.name),
                      );
                    }).toList(),
                  ),
                ),
                Flexible(
                  child: TabBarView(
                    controller: _controller,
                    children: const [
                      BasicsKundliPage(),
                      ChartsKundliPage(),
                      KPKundliPage(),
                      AstakvargaTabPage(),
                      DashaKundliPage(),
                      NestedTbPage(),
                    ],
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

class TabList {
  final String name;
  //final Icon icon;

  TabList({
    // required this.icon,
    required this.name,
  });
}

final List<TabList> cat = [
  TabList(
    name: "Basics",
  ),
  TabList(
    name: "Charts",
  ),
  TabList(
    name: "KP",
  ),
  TabList(
    name: "Ashtakvarga",
  ),
  TabList(
    name: "Dasha",
  ),
  TabList(
    name: "Report",
  ),
];
