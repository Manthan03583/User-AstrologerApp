import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

class ChatList {
  late final String title, date, time, chatId;
  late final double amount;

  ChatList({
    required this.title,
    required this.date,
    required this.time,
    required this.chatId,
    required this.amount,
  });
}

final List<ChatList> chatlist = [
  ChatList(
      title: "Chat with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      chatId: "#CHAT_NEW523520",
      amount: 10),
  ChatList(
      title: "Chat with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      chatId: "#CHAT_NEW523520",
      amount: 19),
  ChatList(
      title: "Chat with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      chatId: "#CHAT_NEW523520",
      amount: 30),
  ChatList(
      title: "Chat with Astrologer For 23 mins",
      date: "13 may 23",
      time: "2:45 PM",
      chatId: "#CHAT_NEW523520",
      amount: 25),
];

class ChatListContent extends StatefulWidget {
  const ChatListContent(
      {super.key,
      required,
      required this.title,
      required this.date,
      required this.time,
      required this.chatId,
      required this.amount});
  final String title, date, time, chatId;
  final double amount;

  @override
  State<ChatListContent> createState() => _ChatListContentState();
}

class _ChatListContentState extends State<ChatListContent> {
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
                  Text(widget.chatId,
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
