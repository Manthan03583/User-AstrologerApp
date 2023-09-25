import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kbspinningwheel/kbspinningwheel.dart';

class KBSpinningwheel extends StatelessWidget {
  KBSpinningwheel({super.key});

  StreamController _dividerController = StreamController<int>();
  StreamController _wheelNotifier = StreamController<double>();

  double _generateRandomAngle() {
    double anglePerItem = 2 * pi / 12 * 0.4;
    double initialAngle = anglePerItem;
    return initialAngle;
  }

  double _randomVelocity() => (Random().nextDouble() * 6000) + 2000;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SpinningWheel(
                image: Image.asset('assets/images/zodiacwheel.png'),
                width: MediaQuery.of(context).size.width * 1.5,
                height: MediaQuery.of(context).size.height * 0.5,
                initialSpinAngle: _generateRandomAngle(),
                shouldStartOrStop: _wheelNotifier.stream,
                spinResistance: 0.2,
                canInteractWhileSpinning: false,
                dividers: 12,
                onUpdate: (value) {
                  _dividerController.add(value);
                  //print(value);
                },
                onEnd: (value) {
                  _dividerController.add(value);
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.23),
                child: StreamBuilder(
                    stream: _dividerController.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshort) {
                      return snapshort.hasData
                          ? DesignZodiacReport(selected: snapshort.data)
                          : Container();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DesignZodiacReport extends StatelessWidget {
  DesignZodiacReport({super.key, required this.selected});
  int selected;

  final Map<int, String> labels = {
    1: 'Aries',
    2: 'Taurus',
    3: 'Gemini',
    4: 'Cancer',
    5: 'Leo',
    6: 'Virgo',
    7: 'Libra',
    8: 'Scorpio',
    9: 'Sagittarius',
    10: 'Capricornus',
    11: 'Aquarius',
    12: 'Pisces',
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.89,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${labels[selected]}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const Text(
                        'May 12, 2023',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/images/taurus.png'),
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              const Text(
                "Don't focus too much on work and take out some time for yourself from your busy schedule. You can plan lunch or outing with your loved ones and family as spending time with them will help you today. Maintaining a positive attitude throughout the  day will help you feel better.",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
