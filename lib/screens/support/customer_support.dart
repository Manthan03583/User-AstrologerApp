import 'package:astrology_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import '../../utils/properties.dart';
import 'ticket_list.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  bool isEditable = false;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 48, 0, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            Text(
                              " Customer Support",
                              style:
                                  TextStyle(color: textColor(), fontSize: 20),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Visibility(
                                visible: isVisible,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                          isEditable = !isEditable;
                                        });
                                      },
                                      child: const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          Icons.list,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isEditable,
                                child: const SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 22),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Icon(
                                            Icons.checklist_outlined,
                                            size: 25,
                                            color: Colors.white,
                                          )
                                        ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Flexible(child: RaisedTicketList())
            ],
          ),
        ),
      ),
    );
  }
}
