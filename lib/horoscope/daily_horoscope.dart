
import 'package:astrology_app/horoscope/horoscope_content.dart';
import 'package:flutter/material.dart';

class DailyHoroscopeData extends StatefulWidget {
  const DailyHoroscopeData({super.key});

  @override
  State<DailyHoroscopeData> createState() => _DailyHoroscopeDataState();
}

class _DailyHoroscopeDataState extends State<DailyHoroscopeData>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child:  Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            children: [
              TabBar(
                indicator: UnderlineTabIndicator(
                    insets: EdgeInsets.only(left: width * 0.05, right: width * 0.05,),
                    borderSide: const BorderSide(color: Colors.blue, width: 2)),
                  //isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        "Yesterday",
                        style: TextStyle(fontSize: width * 0.03),
                      ),
                    ),
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(fontSize: width * 0.03),
                          ),
                          SizedBox(
                            height: width * 0.01,
                          ),
                          Text(
                            "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
                            style: TextStyle(fontSize: width * 0.03),
                          ),
                          SizedBox(
                            height: width * 0.01,
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Tomorrow",
                        style: TextStyle(fontSize: width * 0.03),
                      ),
                    ),
                  ]),
              Flexible(
                child: TabBarView(
                  controller: _tabController,
                    //physics: AlwaysScrollableScrollPhysics(),
                    children: const [
                      HoroscopeContentScreen(),
                      HoroscopeContentScreen(),
                      HoroscopeContentScreen(),
                    ]),
              )
            ],
          ),
      ),
      
    );
  }
}
