import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

class VideoCallList {
  late final String title, date, time, videoCallId;
  late final double amount;

  VideoCallList({
    required this.title,
    required this.date,
    required this.time,
    required this.videoCallId,
    required this.amount,
  });
}

final List<VideoCallList> videoCallList = [
  VideoCallList(
      title: "Video Call with Astrologer For 13 mins",
      date: "13 may 23",
      time: "2:45 PM",
      videoCallId: "#Call_NEW523520",
      amount: 23),
  VideoCallList(
      title: "Video Call with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      videoCallId: "#Call_NEW523520",
      amount: 35),
  VideoCallList(
      title: "Video Call with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      videoCallId: "#Call_NEW523520",
      amount: 30),
  VideoCallList(
      title: "Video Call with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      videoCallId: "#Call_NEW523520",
      amount: 50),
];

class VideoCallListContent extends StatefulWidget {
  const VideoCallListContent(
      {super.key,
      required,
      required this.title,
      required this.date,
      required this.time,
      required this.videoCallId,
      required this.amount});
  final String title, date, time, videoCallId;
  final double amount;

  @override
  State<VideoCallListContent> createState() => _VideoCallListContentState();
}

class _VideoCallListContentState extends State<VideoCallListContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal:
                    BorderSide(color: Color.fromARGB(255, 55, 55, 55)))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(color: textColor(), fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${widget.date} , ${widget.time}",
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.videoCallId,
                      style: const TextStyle(color: Colors.grey, fontSize: 10)),
                  Text("₹ ${widget.amount.toString()}",
                    style: const TextStyle(color: Colors.green, fontSize: 12)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
