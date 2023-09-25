import 'package:flutter/material.dart';
import '../../models/conersation_model.dart';
import '../../utils/properties.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  Stream? chats;

  Widget chatMessageList() {
    return ListView.builder(
        itemCount: chat.length,
        //shrinkWrap: true,
        itemBuilder: (context, index) {
          return MessageTile(
            message: chat[index].text,
            sendByMe: chat[index].sendBy,
          );
        });
    //   return StreamBuilder(
    //     stream: chats,
    //     builder: (context, AsyncSnapshot snapshot) {
    //       return snapshot.hasData
    //           ? ListView.builder(
    //               itemCount: chat.length,
    //               itemBuilder: (context, index) {
    //                 return MessageTile(
    //                   message: chat[index].text,
    //                   sendByMe: chat[index].sendBy,
    //                   // sendBy: Constants.myName== snapshot.data.documents[index].data["sendBy"],
    //                 );
    //               })
    //           : Container();
    //     },
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 48, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              child: Image.asset(
                                "assets/images/astrologers/astro5.jpg",
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 1,
                            bottom: 1,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: Colors.greenAccent[400]),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shargun Agarwal",
                            //"Kumari Puspita Puspajyoti nayak swain",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: textColor()),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Username",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Divider(
                  color: Colors.grey[500],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.84,
                  child: Stack(
                    children: [
                      chatMessageList(),
                      // Container(
                      //     color: Colors.amber,
                      //     height: MediaQuery.of(context).size.height * 0.75,
                      //     margin: const EdgeInsets.only(bottom: 70),
                      //     //color: Colors.amber,
                      //     child: chatMessageList()
                      // StreamBuilder(
                      //   stream: chats,
                      //   builder: (
                      //     context,
                      //     AsyncSnapshot snapshot,
                      //   ) {
                      //     if (snapshot.connectionState ==
                      //         ConnectionState.waiting) {
                      //       return const CircularProgressIndicator();
                      //     } else if (snapshot.connectionState ==
                      //             ConnectionState.active ||
                      //         snapshot.connectionState == ConnectionState.done) {
                      //       if (snapshot.hasError) {
                      //         return const Text('Error');
                      //       } else if (snapshot.hasData) {
                      //         return ListView.builder(
                      //             itemCount: chat.length,
                      //             itemBuilder: (context, index) {
                      //               return MessageTile(
                      //                 message: chat[index].text,
                      //                 sendByMe: chat[index].sendBy,
                      //                 // sendBy: Constants.myName== snapshot.data.documents[index].data["sendBy"],
                      //               );
                      //             });
                      //       } else {
                      //         return const Text('Empty data');
                      //       }
                      //     } else {
                      //       return Text('State: ${snapshot.connectionState}');
                      //     }
                      //   },
                      // ),
                      //),
                      // Positioned(
                      //     bottom: 0,
                      //     child: Container(
                      //       color: Colors.blueAccent,
                      //       child: Text("data"),
                      //     ))
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: SizedBox(
                            child: Card(
                              color: const Color.fromARGB(255, 239, 244, 247),
                              margin: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    //controller: messageController,
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.black,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: " Write message",
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  )),
                                  GestureDetector(
                                    onTap: () {
                                      //sendMessage();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40)),
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        child: const Icon(
                                          Icons.send,
                                          color:
                                              Color.fromARGB(244, 81, 190, 215),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
