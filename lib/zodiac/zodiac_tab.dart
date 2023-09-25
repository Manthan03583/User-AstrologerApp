import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:astrology_app/zodiac/zodiac_matching.dart';
import 'package:astrology_app/zodiac/zodiac_new_matching.dart';
import 'package:flutter/material.dart';

class ZodiacTab extends StatefulWidget {
  const ZodiacTab({super.key});

  @override
  State<ZodiacTab> createState() => _ZodiacTabState();
}

class _ZodiacTabState extends State<ZodiacTab> with TickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
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
                    // height: 50,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TabBar(
                            controller: _tabController,
                            labelColor: Colors.white,
                            indicatorColor: Colors.white,
                            unselectedLabelColor: Colors.white,
                            indicatorWeight: 2,
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
                    children: const [ZodiacMatching(), ZodiacNewMatching()],
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
