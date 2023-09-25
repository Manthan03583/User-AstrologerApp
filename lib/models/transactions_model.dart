import 'package:astrology_app/screens/Home_page.dart';
import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

class TransactionList {
  late final String title, date, time, callId, paymentMode, status;
  late final double amount;

  TransactionList({
    required this.title,
    required this.date,
    required this.time,
    required this.callId,
    required this.paymentMode,
    required this.amount,
    required this.status,
  });
}

final List<TransactionList> transactionList = [
  TransactionList(
      title: "Wallet Recharge",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      status: " ",
      amount: 500,
      paymentMode: ''),
  TransactionList(
      title: "Deducted amount for call",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      status: "Failed ",
      amount: 250,
      paymentMode: ''),
  TransactionList(
      title: "Wallet Recharge",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      status: " ",
      amount: 190,
      paymentMode: ''),
  TransactionList(
      title: "Wallet Recharge",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      status: "Failed",
      amount: 300,
      paymentMode: ''),
  TransactionList(
      title: "Deducted amount for call",
      date: "13 may 23",
      time: "2:45 PM",
      callId: "#Call_NEW523520",
      status: " ",
      amount: 1000,
      paymentMode: ''),
];

class TransactionContent extends StatelessWidget {
  const TransactionContent(
      {super.key,
      required this.title,
      required this.date,
      required this.time,
      required this.callId,
      required this.paymentMode,
      required this.status,
      required this.amount});
  final String title, date, time, callId, paymentMode, status;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: textColor(), fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$date at $time",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title == "Wallet Recharge" ? "+ ₹ $amount" : "₹ $amount",
                    // If amount is added then add a '+' sign to show money added and '-' for money deduction
                    style: TextStyle(
                        color: status != "Failed"
                            ? Colors.green
                            : Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    status,
                    style: TextStyle(
                        color:
                            status == "Failed" ? Colors.red[400] : Colors.green,
                        // check for fail or success  den add colors according to status
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          //shrinkWrap: true,
          itemCount: transactionList.length,
          itemBuilder: ((context, index) => TransactionContent(
              title: transactionList[index].title,
              date: transactionList[index].date,
              time: transactionList[index].time,
              callId: transactionList[index].callId,
              paymentMode: transactionList[index].paymentMode,
              status: transactionList[index].status,
              amount: transactionList[index].amount))),
    );
  }
}
