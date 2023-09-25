import 'package:flutter/material.dart';
import '../../utils/properties.dart';
import 'astrologers_list.dart';

class ChatTabScreen extends StatefulWidget {
  const ChatTabScreen({super.key});

  @override
  State<ChatTabScreen> createState() => _ChatTabScreenState();
}

class _ChatTabScreenState extends State<ChatTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)),
                  child: Text(
                    "₹ 0",
                    style: TextStyle(color: textColor()),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.filter_alt_sharp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            //Container(
            // padding: const EdgeInsets.only(top: 3),
            //color: Colors.amber,
            //height: MediaQuery.of(context).size.height,
            //child:
            const Flexible(child: SubTabView()),
            // ),
          ],
        ),
      ),
    );
  }
}

//double? iconSize;
class SubTabView extends StatefulWidget {
  const SubTabView({super.key});

  @override
  State<SubTabView> createState() => _SubTabViewState();
}

class _SubTabViewState extends State<SubTabView> with TickerProviderStateMixin {
  late TabController _nestedTabController;
  int selectedIndex = -1;
  int ind = 0;

  @override
  void initState() {
    super.initState();
    _nestedTabController = TabController(length: cat.length, vsync: this);
  }
  

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //iconSize = width * 0.1;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TabBar(
              controller: _nestedTabController,
              // physics: const ClampingScrollPhysics(),
              labelColor: iconColor(),
              unselectedLabelColor: textColor(),
              onTap: (index){
                for(int i=0; i<cat.length; i++){
                  if(i==index){
                    cat[i].change = true;
                  }
                  else{
                    cat[i].change = false;
                  }
                }
                setState(() {
                  
                });
              },
              automaticIndicatorColorAdjustment: false,
              indicatorWeight: 0.1,
              // indicatorPadding: EdgeInsets.all(7),
              //indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(fontSize: width * 0.038),
              isScrollable: true,
              //indicatorColor: Colors.blue,
              // indicatorSize: TabBarIndicatorSize.label,
              // indicator: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.blue,
              //     ),
              //     borderRadius: BorderRadius.circular(25.0)),
              tabs: cat.map<Widget>((TabList tab) {
                return Tab(
                  //iconMargin: EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(width * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: tab.change ? Colors.blue: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      children: [
                        
                        tab.icon,
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Text(tab.name, style: TextStyle(fontSize: width * 0.038),)
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          Expanded(
            child: TabBarView(
      physics: const NeverScrollableScrollPhysics(),
                    controller: _nestedTabController, children: const [
                                    AstrologerList(),
                                    AstrologerList(),
                                    AstrologerList(),
                                    AstrologerList(),
                                  ]),
                
          )
        ],
      ),
    );
  }
}

class TabList {
  final String name;
  final Icon icon;
   bool change;
   //Function(int) updateVal;

  TabList({
    required this.icon,
    required this.name,
    required this.change,
   // required this.updateVal
  });
}

final List<TabList> cat = [
  TabList(
    icon: const Icon(
      Icons.dashboard,
      size: 18,
      color: Colors.white,
    ),
    name: "All",
    change: true,
  ),
  TabList(
    icon: const Icon(
      Icons.favorite,
      size: 18,
      color: Colors.red,
    ),
    name: "Love",
    change: false,
  ),
  TabList(
    icon: const Icon(
      Icons.cases_rounded,
      size: 18,
      color: Colors.blue,
    ),
    name: "Career",
    change: false,
  ),
  TabList(
    icon: const Icon(
      Icons.celebration_rounded,
      size: 18,
      color: Colors.green,
    ),
    name: "Marriage",
    change: false,
  ),
];
