import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: width * 0.02,
              ),
              Text(
                "Aries",
                style: TextStyle(color: textColor(), fontSize: width * 0.05),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              Text(
                "Date Range",
                style: TextStyle(color: textColor(), fontSize: width * 0.035),
              ),
              SizedBox(
                height: width * 0.033,
              ),
              Text(
                "nhdbuvdcvsghvcgsvcuyhas hsvauy hasscgschsvcgsvcsvcsavchvchsvhshxbbaxujBXbbdbwbbbbbbxhbcbdcbhInject a bright beautiful and glorious picture in your mind to uplift your spirits. Finances improve later in the day. Enjoy a peaceful and quiet day with family members-If people approach you with problems.Finances improve later in the day.",
                style: TextStyle(color: textColor(), fontSize: width * 0.03)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
