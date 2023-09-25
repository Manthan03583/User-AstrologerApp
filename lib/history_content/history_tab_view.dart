import 'package:flutter/material.dart';
import 'history_list.dart';

class HistoryTabContent extends StatefulWidget {
  const HistoryTabContent({super.key});

  @override
  State<HistoryTabContent> createState() => _HistoryTabContentState();
}

class _HistoryTabContentState extends State<HistoryTabContent>
    with TickerProviderStateMixin {
  //late TabController _tabController;

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: cat.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: cat.length,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.only(left: width * 0.05, right: width * 0.05,),
                  borderSide: const BorderSide(color: Colors.amber)),
              // isScrollable: true,
              tabs: cat.map<Widget>((TabList tab) {
                return Tab(
                  child: Text(
                    tab.name,
                    style: TextStyle(fontSize: width * 0.03),
                  ),
                );
              }).toList(),
            ),
            const Expanded(
                child: TabBarView(
              children: [
                ChatListHistory(),
                CallListHistory(),
                VideoCallListHistory(),
                LiveHistory()
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class TabList {
  final String name;

  TabList({
    required this.name,
  });
}

final List<TabList> cat = [
  TabList(
    name: "Chat",
  ),
  TabList(
    name: "Call",
  ),
  TabList(
    name: "Video call",
  ),
  // TabList(
  //   name: "Astroshop",
  // ),
  TabList(
    name: "Live",
  ),
];
