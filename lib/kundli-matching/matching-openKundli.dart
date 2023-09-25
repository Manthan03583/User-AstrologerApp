import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';
import 'kundliclass.dart';
import 'newmatch.dart';

class KundliMainPage extends StatefulWidget {
  const KundliMainPage({super.key});

  @override
  State<KundliMainPage> createState() => _KundliMainPageState();
}

class _KundliMainPageState extends State<KundliMainPage>
    with TickerProviderStateMixin {
  late TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const HadLineP(text: 'Kundli'),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.87,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            labelPadding: EdgeInsets.symmetric(horizontal: 37),
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white),
                                color: Colors.blue),
                            tabs: const [
                              Tab(
                                child: Text(
                                  'Open Kundli',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'New Matching',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [OpenKundliTab1(), NewMatchingNM()],
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
