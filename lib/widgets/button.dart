import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget text;
  const PrimaryButton({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 18),
        height: 48,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue[600]),
        child: text);
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget text;
  const SecondaryButton({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
        height: 48,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: text);
  }
}
