import 'package:flutter/material.dart';

class Chat {
  final String text;
  bool sendBy;

  Chat({
    required this.text,
    required this.sendBy,
  });
}

final List<Chat> chat = [
  Chat(
    text: "Hiii",
    sendBy: false,
  ),
  Chat(
    text: "How are you",
    sendBy: true,
  ),
  Chat(
    text: "How can i Help",
    sendBy: true,
  ),
  Chat(
    text: "no more ",
    sendBy: false,
  ),
  Chat(
    text: "nnxiciwjci",
    sendBy: true,
  ),
  Chat(
    text: "Chjnewencoeat",
    sendBy: false,
  ),
  Chat(
    text: "Chkciowjcioat",
    sendBy: true,
  ),
  Chat(
    text: "nciwci",
    sendBy: false,
  ),
  Chat(
    text: "jecefni",
    sendBy: false,
  ),
];

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;

  const MessageTile({
    super.key,
    required this.message,
    required this.sendByMe,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: 5,
            bottom: 8,
            left: sendByMe ? 0 : 20,
            right: sendByMe ? 20 : 0),
        alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: sendByMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))
                  : const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
              gradient: LinearGradient(
                  colors: sendByMe
                      ? [
                           Color.fromARGB(255, 91, 91, 91),
                           Color.fromARGB(255, 91, 91, 91),
                        ]
                      : [
                          const Color.fromARGB(255, 91, 91, 91),
                          const Color.fromARGB(255, 91, 91, 91)
                        ])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
