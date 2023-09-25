import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

class LiveList {
  late final String title, date, time, liveId;
  late final double amount;

  LiveList({
    required this.title,
    required this.date,
    required this.time,
    required this.liveId,
    required this.amount,
  });
}

final List<LiveList> liveList = [
  LiveList(
      title: "Video Call with Astrologer For 13 mins",
      date: "13 may 23",
      time: "2:45 PM",
      liveId: "#Call_NEW523520",
      amount: 10),
  LiveList(
      title: "Call with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      liveId: "#Call_NEW523520",
      amount: 19),
  LiveList(
      title: "Chat with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      liveId: "#Call_NEW523520",
      amount: 30),
  LiveList(
      title: "Audio Call with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      liveId: "#Call_NEW523520",
      amount: 25),
];

class LiveListContent extends StatefulWidget {
  const LiveListContent(
      {super.key,
      required,
      required this.title,
      required this.date,
      required this.time,
      required this.liveId,
      required this.amount});
  final String title, date, time, liveId;
  final double amount;

  @override
  State<LiveListContent> createState() => _LiveListContentState();
}

class _LiveListContentState extends State<LiveListContent> {
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
                  Text(widget.liveId,
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
