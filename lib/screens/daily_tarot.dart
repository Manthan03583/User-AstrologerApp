import 'package:flutter/material.dart';

class DailyTarot extends StatefulWidget {
  const DailyTarot({super.key});

  @override
  State<DailyTarot> createState() => _DailyTarotState();
}

class _DailyTarotState extends State<DailyTarot> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.only(left: height * 0.006, right: height * 0.006),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/unsplash.jpg",
                //images[index].toString(),
                height: height * 0.19,
                //width: width * 0.2,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Image.asset(
                "assets/images/unsplash.jpg",
                //images[index].toString(),
                height: height * 0.19,
                //width: 85,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Image.asset(
                "assets/images/unsplash.jpg",
                //images[index].toString(),
                height: height * 0.19,
                // width: 85,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
