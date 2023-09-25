import 'package:flutter/material.dart';
import '../../utils/properties.dart';

class TicketList {
  late final String title, description, date, time, value;

  TicketList({
    required this.title,
    required this.date,
    required this.time,
    required this.description,
    required this.value,
  });
}

final List<TicketList> ticketList = [
  TicketList(
      title: "Session with Shargun Agarwal",
      description: "We are trying to resolve your query as soon as possible",
      date: "13 may 23",
      time: "2:45 PM",
      value: ""),
  TicketList(
      title: "Session with Shargun Agarwal",
      description: "We are trying to resolve your query as soon as possible",
      date: "13 may 23",
      time: "2:45 PM",
      value: ""),
  TicketList(
      title: "Session with Shargun Agarwal",
      description: "We are trying to resolve your query as soon as possible",
      date: "13 may 23",
      time: "2:45 PM",
      value: ""),
  TicketList(
      title: "Session with Shargun Agarwal",
      description: "We are trying to resolve your query as soon as possible",
      date: "13 may 23",
      time: "2:45 PM",
      value: ""),
  TicketList(
      title: "Session with Shargun Agarwal",
      description: "We are trying to resolve your query as soon as possible",
      date: "13 may 23",
      time: "2:45 PM",
      value: ""),
];

class TicketListContent extends StatefulWidget {
  const TicketListContent(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.time,
      required this.value});

  final String title, description, date, time, value;

  @override
  State<TicketListContent> createState() => _TicketListContentState();
}

class _TicketListContentState extends State<TicketListContent> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 18, 8),
          child: Row(
            children: [
              Visibility(
                child: SizedBox(
                  child: Checkbox(
                    checkColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    // fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(color: textColor(), fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.date} at ${widget.time}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RaisedTicketList extends StatefulWidget {
  const RaisedTicketList({super.key});

  @override
  State<RaisedTicketList> createState() => _RaisedTicketListState();
}

class _RaisedTicketListState extends State<RaisedTicketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          //shrinkWrap: true,
          itemCount: ticketList.length,
          itemBuilder: ((context, index) => TicketListContent(
                title: ticketList[index].title,
                date: ticketList[index].date,
                time: ticketList[index].time,
                description: ticketList[index].description,
                value: ticketList[index].value,
              ))),
    );
  }
}
