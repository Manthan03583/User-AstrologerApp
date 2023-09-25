import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

class CallList {
  late final String title, date, time, callId;
  late final double amount;

  CallList({
    required this.title,
    required this.date,
    required this.time,
    required this.callId,
    required this.amount,
  });
}

final List<CallList> callList = [
  CallList(
      title: "Call with Astrologer For 13 mins",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      amount: 10),
  CallList(
      title: "Call with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      amount: 19),
  CallList(
      title: "Call with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      amount: 30),
  CallList(
      title: "Call with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      amount: 25),
];

class CallListContent extends StatefulWidget {
  const CallListContent(
      {super.key,
      required,
      required this.title,
      required this.date,
      required this.time,
      required this.callId,
      required this.amount});
  final String title, date, time, callId;
  final double amount;

  @override
  State<CallListContent> createState() => _CallListContentState();
}

class _CallListContentState extends State<CallListContent> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal:
                    BorderSide(color: Color.fromARGB(255, 55, 55, 55)))),
        child: Padding(
          padding:
              EdgeInsets.only(left: width * 0.03, right: width * 0.03, top: width * 0.022, bottom: width * 0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(color: textColor(), fontSize: width * 0.04),
              ),
              SizedBox(
                height: width * 0.022,
              ),
              Text(
                "${widget.date} , ${widget.time}",
                style: TextStyle(color: Colors.grey, fontSize: width * 0.028),
              ),
              SizedBox(
                height: width * 0.013,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.callId,
                      style: TextStyle(color: Colors.grey, fontSize: width * 0.028)),
                  Text("₹ ${widget.amount.toString()}",
                      style: TextStyle(color: Colors.green, fontSize: width * 0.032))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
