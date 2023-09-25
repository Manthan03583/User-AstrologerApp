import 'package:astrology_app/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../../utils/properties.dart';
import 'history_tab_view.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: SizedBox(
        //height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(width * 0.01, width * 0.12, width * 0.01, width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: width * .08,
                    ),
                  ),
                  SizedBox(
                    width: width * .01,
                  ),
                  Text(
                    "History",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w500, color: textColor()),
                  ),
                ],
              ),
              
              const Flexible(child: HistoryTabContent()),
              SizedBox(
                    width: width * .01,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
