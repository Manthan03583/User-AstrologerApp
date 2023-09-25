import 'package:astrology_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TransactionCompleted extends StatefulWidget {
  final bool isTransactionCompleted;
  const TransactionCompleted({super.key, required this.isTransactionCompleted});

  @override
  State<TransactionCompleted> createState() => _TransactionCompletedState();
}

class _TransactionCompletedState extends State<TransactionCompleted>
    with TickerProviderStateMixin {
  //late AnimationController controller;
  late Animation<double> animation;
  late AnimationController lottieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lottieController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    //controller = lottieController();
    // controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 1));
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Lottie.asset( widget.isTransactionCompleted ? 'assets/lottie/success.json' : 'assets/lottie/failure.json', repeat: false,
                //controller: lottieController,
                onLoaded: (composition) {
              lottieController.duration = composition.duration;
              // lottieController.forward();
            }),
          ),

          // ScaleTransition(
          //   scale: animation,
          //   child: SizedBox(
          //     height: 200,
          //     width: 200,
          //     child: Center(
          //       child: Image.asset('assets/images/sucess_wallet.jpg'),
          //     ),
          //   ),
          // ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => HomePage())));
              },
              child: const Text(
                "Close",
                style: TextStyle(fontSize: 18),
              )),
        ],
      ),
    );
  }
}
