import 'package:flutter/material.dart';

import 'report_kundli.dart';
import 'report_planetary_page.dart';

class NestedTbPage extends StatefulWidget {
  const NestedTbPage({super.key});

  @override
  State<NestedTbPage> createState() => _NestedTbPageState();
}

class _NestedTbPageState extends State<NestedTbPage>
    with TickerProviderStateMixin {
  TabController? _nController;
  @override
  void initState() {
    _nController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.015),
            child: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              controller: _nController,
              labelPadding: const EdgeInsets.all(0),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.blue,
              indicatorWeight: 2,
              tabs: const [
                Tab(
                  text: 'General',
                ),
                Tab(
                  text: 'Remedies',
                ),
                Tab(
                  text: 'Dasha',
                ),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _nController,
              children: const [
                DesTbPage(),
                DesTbPage(),
                DesTbPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//******* USER REPORT KUNDLI TAB *******//

class DesTbPage extends StatefulWidget {
  const DesTbPage({super.key});

  @override
  State<DesTbPage> createState() => _DesTbPageState();
}

class _DesTbPageState extends State<DesTbPage> with TickerProviderStateMixin {
  TabController? _dsController;
  @override
  void initState() {
    _dsController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: width * 0.1,
              child: TabBar(
                physics: const ClampingScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.label,
                controller: _dsController,
                labelPadding: const EdgeInsets.all(0),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.blue,
                // indicatorWeight: 2,
                indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                tabs: [
                  Tab(
                    child: Container(
                      width: width * 0.18,
                      // width: MediaQuery.of(context).size.width*0.50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 215, 117),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'General',
                          style: TextStyle(fontSize: width * 0.03),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 5,),

                  Tab(
                    child: Container(
                      width: width * 0.2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 215, 117),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Planetary',
                          style: TextStyle(fontSize: width * 0.03),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 5,),

                  Tab(
                    child: Container(
                      width: width * 0.22,
                      // width: MediaQuery.of(context).size.width*0.90,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 215, 117),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Vimshottari\nDasha',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: width * 0.027),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 5,),

                  Tab(
                    child: Container(
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 215, 117),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text('Yoga',
                      style: TextStyle(fontSize: width * 0.03),)),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _dsController,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: ReportKundliPage(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PlanetaryKundli(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PlanetaryKundli(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PlanetaryKundli(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatTbPage extends StatefulWidget {
  const ChatTbPage({super.key});

  @override
  State<ChatTbPage> createState() => _ChatTbPageState();
}

class _ChatTbPageState extends State<ChatTbPage> with TickerProviderStateMixin {
  TabController? _chatController;
  @override
  void initState() {
    _chatController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
            children: [
              SizedBox(
                height: width * 0.09,
                child: TabBar(
                  //isScrollable: true,
                  physics: const NeverScrollableScrollPhysics(),
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _chatController,
                  labelPadding: const EdgeInsets.all(0),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  // isScrollable: true,
                  // indicatorWeight: 2,
                  indicator: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  tabs: [
                    Tab(
                      child: Container(
                        height: width * 0.09,
                        width: width * 0.2,
                        // width: MediaQuery.of(context).size.width*0.50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 215, 117),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'General',
                            softWrap: true,
                            style: TextStyle(fontSize: width * 0.03),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(width: 5,),
      
                    Tab(
                      child: Container(
                        height: width * 0.09,
                        width: width * 0.22,
      
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 215, 117),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Align(
                          child: Text(
                            'Planetary',
                            style: TextStyle(fontSize: width * 0.03),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(width: 5,),
      
                    Tab(
                      child: Container(
                        height: width * 0.09,
                        width: width * 0.17,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 215, 117),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Yoga',
                            style: TextStyle(fontSize: width * 0.03),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: TabBarView(
                  controller: _chatController,
                  children: const [
                    ReportKundliPage(),
                    ReportKundliPage(),
                    ReportKundliPage(),
                  ],
                ),
              ),
            ],
          ),
      ),
      //),
    );
  }
}

//********   Ashtakvarga  list of tab *********//

class AstakPage extends StatefulWidget {
  const AstakPage({super.key});

  @override
  State<AstakPage> createState() => _AstakPageState();
}

class _AstakPageState extends State<AstakPage> with TickerProviderStateMixin {
  TabController? _astakController;
  int selectedIndex = 0;
  @override
  void initState() {
    _astakController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: width * .1,
              child: TabBar(
                //isScrollable: true,
                physics: const NeverScrollableScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.label,
                controller: _astakController,
                labelPadding: const EdgeInsets.all(0),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                //indicatorWeight: 0.1,
                indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                tabs: cat.map<Widget>((ATabList tab) {
                  return Tab(
                    child: Container(
                      // height: 35,
                      // // width: MediaQuery.of(context).size.width*0.50,
                      // width: 83,

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 215, 117),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          tab.name,
                          //textAlign: TextAlign.center,
                          style: TextStyle(fontSize: width * 0.03),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                // tabs: [
                //   Tab(
                //     child: Container(
                //       height: 35,
                //       width: 73,
                //       // width: MediaQuery.of(context).size.width*0.50,
                //       decoration: BoxDecoration(
                //         color: const Color.fromARGB(255, 248, 215, 117),
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.only(
                //             left: 15, right: 15, top: 10, bottom: 10),
                //         child: Text(
                //           'Sav',
                //           style: TextStyle(fontSize: 12),
                //         ),
                //       ),

                //       // tabs: cat.map<Widget>((ATabList tab) {
                //       //   return Tab(
                //       //     child: Row(
                //       //       children: [Text(tab.name)],
                //       //     ),
                //       //   );
                //       // }).toList(),
                //       // child: const Padding(
                //       //   padding: EdgeInsets.only(
                //       //       left: 15, right: 15, top: 10, bottom: 10),
                //       //   child: Text(
                //       //     'Sav',
                //       //     style: TextStyle(fontSize: 12),
                //       //   ),
                //       // ),
                //     ),
                //   ),

                //   Tab(
                //     child: Container(
                //       height: 35,
                //       // width: MediaQuery.of(context).size.width*0.50,
                //       width: 83,

                //       decoration: BoxDecoration(
                //         color: const Color.fromARGB(255, 248, 215, 117),
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.only(
                //             left: 15, right: 15, top: 10, bottom: 10),
                //         child: Text(
                //           'Asc',
                //           style: TextStyle(fontSize: 12),
                //         ),
                //       ),
                //     ),
                //   ),

                //   Tab(
                //     child: Container(
                //       height: 35,
                //       width: 350,
                //       // width: MediaQuery.of(context).size.width*0.90,
                //       decoration: BoxDecoration(
                //         color: const Color.fromARGB(255, 248, 215, 117),
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.only(
                //             left: 15, right: 15, top: 5, bottom: 5),
                //         child: Align(
                //           alignment: Alignment.center,
                //           child: Text(
                //             'Jupiter',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(fontSize: 10),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),

                //   Tab(
                //     child: Container(
                //       height: 35,
                //       // width: MediaQuery.of(context).size.width*0.18,
                //       width: 64,
                //       decoration: BoxDecoration(
                //         color: const Color.fromARGB(255, 248, 215, 117),
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.only(
                //             left: 17, right: 15, top: 9, bottom: 8),
                //         child: Text('Mars'),
                //       ),
                //     ),
                //   ),

                //   Tab(
                //     child: Container(
                //       height: 35,
                //       // width: MediaQuery.of(context).size.width*0.18,
                //       width: 64,
                //       decoration: BoxDecoration(
                //         color: const Color.fromARGB(255, 248, 215, 117),
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.only(
                //             left: 17, right: 15, top: 9, bottom: 8),
                //         child: Text('Mercury'),
                //       ),
                //     ),
                //   ),

                //   Tab(
                //     child: Container(
                //       height: 35,
                //       // width: MediaQuery.of(context).size.width*0.18,
                //       width: 64,
                //       decoration: BoxDecoration(
                //         color: const Color.fromARGB(255, 248, 215, 117),
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.only(
                //             left: 17, right: 15, top: 9, bottom: 8),
                //         child: Text('Moon'),
                //       ),
                //     ),
                //   ),
                // ],
              ),
            ),
            Flexible(
              child: TabBarView(
                controller: _astakController,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: ReportKundliPage(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PlanetaryKundli(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PlanetaryKundli(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PlanetaryKundli(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PlanetaryKundli(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: PlanetaryKundli(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ATabList {
  final String name;
  //final Icon icon;

  ATabList({
    // required this.icon,
    required this.name,
  });
}

final List<ATabList> cat = [
  ATabList(
    name: "Sav",
  ),
  ATabList(
    name: "Asc",
  ),
  ATabList(
    name: "Jupiter",
  ),
  ATabList(
    name: "Mars",
  ),
  ATabList(
    name: "Mercury",
  ),
  ATabList(
    name: "Moon",
  ),
];

//------------------New charts
class CharttabPage extends StatefulWidget {
  const CharttabPage({super.key});

  @override
  State<CharttabPage> createState() => _CharttabPageState();
}

class _CharttabPageState extends State<CharttabPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
