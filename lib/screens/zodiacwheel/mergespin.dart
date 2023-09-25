import 'package:astrology_app/screens/zodiacwheel/kbspinning.dart';
import 'package:flutter/material.dart';

class MergeSpin extends StatelessWidget {
  const MergeSpin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KBSpinningwheel(),
      ],
    );
  }
}
