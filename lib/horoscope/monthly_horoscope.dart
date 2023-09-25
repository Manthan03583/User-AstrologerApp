// ignore: file_names
import 'package:flutter/material.dart';
import 'readings.dart';

class HoroscopeStudy extends StatefulWidget {
  const HoroscopeStudy({super.key});

  @override
  State<HoroscopeStudy> createState() => _HoroscopeStudyState();
}

class _HoroscopeStudyState extends State<HoroscopeStudy> {
  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            TabBar(
              indicator: UnderlineTabIndicator(
                    insets: EdgeInsets.only(left: width * 0.05, right: width * 0.05,),
                    borderSide: const BorderSide(color: Colors.blue, width: 2)),
              tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Weekly",
                    style: TextStyle(fontSize: width * 0.03),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Monthly",
                    style: TextStyle(fontSize: width * 0.03),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Yearly",
                    style: TextStyle(fontSize: width * 0.03),
                  ),
                ),
              ),
            ]),
            const Flexible(
              child: TabBarView(children: [
                ReadingScreen(),
                ReadingScreen(),
                ReadingScreen()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
