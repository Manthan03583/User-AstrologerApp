import 'package:flutter/material.dart';

class SelectAmount {
  final String amountText;
  final String offer;
  final Color color;
  final double amount;

  SelectAmount(
      {required this.amount,
      required this.amountText,
      required this.offer,
      this.color = Colors.blue});
}

List<SelectAmount> amountSelect = [
  SelectAmount(
    amountText: '₹ 50',
    offer: '100% Extra',
    color: Colors.green,
    amount: 50,
  ),
  SelectAmount(
    amountText: '₹ 100',
    offer: '100% Extra',
    color: Colors.green,
    amount: 100,
  ),
  SelectAmount(
    amountText: '₹ 200',
    offer: '50% Extra',
    color: Colors.green,
    amount: 200,
  ),
  SelectAmount(
    amountText: '₹ 500',
    offer: '50% Extra',
    color: Colors.green,
    amount: 500,
  ),
  SelectAmount(
    amountText: '₹ 1000',
    offer: '10% Extra',
    color: Colors.green,
    amount: 1000,
  ),
  SelectAmount(
    amountText: '₹ 2000',
    offer: '10% Extra',
    color: Colors.green,
    amount: 2000,
  ),
  SelectAmount(
    amountText: '₹ 4000',
    offer: '12% Extra',
    color: Colors.green,
    amount: 4000,
  ),
  SelectAmount(
    amountText: '₹ 8000',
    offer: '12% Extra',
    color: Colors.green,
    amount: 8000,
  ),
  SelectAmount(
    amountText: '₹ 15000',
    offer: '20% Extra',
    color: Colors.green,
    amount: 15000,
  ),
];

class AmountSelect extends StatefulWidget {
  AmountSelect({
    super.key,
    required this.amount,
    required this.offer,
    required this.color,
    required this.amountText,
    required this.index,
    required this.selectedIndex,
  });

  final String amountText;
  final String offer;
  final Color color;
  final double amount;
  final int index;
  final int selectedIndex;

  @override
  State<AmountSelect> createState() => _AmountSelectState();
}

class _AmountSelectState extends State<AmountSelect> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: widget.selectedIndex == widget.index
                ? Colors.white.withOpacity(0.4)
                : Colors.white.withOpacity(0.2),
            border: Border.all(
                color: widget.selectedIndex == widget.index
                    ? Colors.white.withOpacity(0.4)
                    : Colors.black),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.amountText,
                style: const TextStyle(
                    fontSize: 17,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.offer,
                style: const TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
