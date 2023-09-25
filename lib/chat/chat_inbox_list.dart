import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';
import 'conversation.dart';

class ChatInboxList extends StatefulWidget {
  const ChatInboxList({super.key});

  @override
  State<ChatInboxList> createState() => _ChatInboxListState();
}

class _ChatInboxListState extends State<ChatInboxList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: chatlistInbox.length,
          itemBuilder: ((context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConversationScreen()));
                },
                child: ChatContent(
                  name: chatlistInbox[index].name,
                  image: chatlistInbox[index].img,
                  text: chatlistInbox[index].text,
                ),
              ))),
    );
  }
}

class Chat {
  final String name, img, text, day;

  Chat({
    required this.name,
    required this.img,
    required this.text,
    required this.day,
  });
}

final List<Chat> chatlistInbox = [
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "2 New messages",
    day: "1d",
  ),
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "Seen",
    day: "1d",
  ),
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "Typing...",
    day: "5d",
  ),
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "Chat",
    day: "1d",
  ),
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "Chat",
    day: "2d",
  ),
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "Chat",
    day: "1d",
  ),
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "Chat",
    day: "1d",
  ),
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "Chat",
    day: "1d",
  ),
  Chat(
    name: "Chat",
    img: "assets/images/astrologers/astro4.jpg",
    text: "Chat",
    day: "1d",
  ),
];

class ChatContent extends StatefulWidget {
  const ChatContent(
      {super.key, required this.name, required this.image, required this.text});
  final String name, image, text;

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
                    color: Color.fromARGB(255, 54, 54, 54), width: 0.5))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.green),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(color: textColor()),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.text,
                  style: TextStyle(color: Colors.grey[500], fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
