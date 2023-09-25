import 'package:astrology_app/models/call_list_model.dart';
import 'package:astrology_app/models/chat_list_model.dart';
import 'package:astrology_app/models/live_model.dart';
import 'package:astrology_app/models/video_call_model.dart';
import 'package:flutter/material.dart';

class ChatListHistory extends StatefulWidget {
  const ChatListHistory({super.key});

  @override
  State<ChatListHistory> createState() => _ChatListHistoryState();
}

class _ChatListHistoryState extends State<ChatListHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          shrinkWrap: true,
          // physics: BouncingScrollPhysics(),
          itemCount: chatlist.length,
          itemBuilder: ((context, index) => ChatListContent(
              title: chatlist[index].title,
              date: chatlist[index].date,
              time: chatlist[index].time,
              chatId: chatlist[index].chatId,
              amount: chatlist[index].amount))),
    );
  }
}

class CallListHistory extends StatefulWidget {
  const CallListHistory({super.key});

  @override
  State<CallListHistory> createState() => _CallListHistoryState();
}

class _CallListHistoryState extends State<CallListHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          shrinkWrap: true,
          //physics: const BouncingScrollPhysics(),
          itemCount: callList.length,
          itemBuilder: ((context, index) => CallListContent(
                title: callList[index].title,
                date: callList[index].date,
                time: callList[index].time,
                amount: callList[index].amount,
                callId: callList[index].callId,
              ))),
    );
  }
}

class VideoCallListHistory extends StatefulWidget {
  const VideoCallListHistory({super.key});

  @override
  State<VideoCallListHistory> createState() => _VideoCallListHistoryState();
}

class _VideoCallListHistoryState extends State<VideoCallListHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          shrinkWrap: true,
          // physics: const BouncingScrollPhysics(),
          itemCount: videoCallList.length,
          itemBuilder: ((context, index) => CallListContent(
                title: videoCallList[index].title,
                date: videoCallList[index].date,
                time: videoCallList[index].time,
                amount: videoCallList[index].amount,
                callId: videoCallList[index].videoCallId,
              ))),
    );
  }
}

class LiveHistory extends StatefulWidget {
  const LiveHistory({super.key});

  @override
  State<LiveHistory> createState() => _LiveHistoryState();
}

class _LiveHistoryState extends State<LiveHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          shrinkWrap: true,
          //physics: const BouncingScrollPhysics(),
          itemCount: liveList.length,
          itemBuilder: ((context, index) => LiveListContent(
                title: liveList[index].title,
                date: videoCallList[index].date,
                time: videoCallList[index].time,
                amount: videoCallList[index].amount,
                liveId: videoCallList[index].videoCallId,
              ))),
    );
  }
}
