import 'package:astrology_app/Wallet/add_wallet_page.dart';
import 'package:astrology_app/Wallet/complete_transaction.dart';
import 'package:astrology_app/constants/keys.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentInformationPage extends StatefulWidget {
  final double amount;
  const PaymentInformationPage({super.key, required this.amount});

  @override
  State<PaymentInformationPage> createState() => _PaymentInformationPageState();
}

class _PaymentInformationPageState extends State<PaymentInformationPage> {
  @override
  Widget build(BuildContext context) {
    double amountToBeRecharged = widget.amount;
    double gst = amountToBeRecharged * 0.18;
    double totalAmount = amountToBeRecharged + gst;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const HadLineP(
                text: 'Payment Information',
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recharge Amount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹ ${amountToBeRecharged.abs()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'GST(18%)',
                            style: TextStyle(
                              color: Color.fromARGB(255, 112, 111, 111),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹ ${gst.abs()}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 112, 111, 111),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Payable Amount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹ $totalAmount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddWalletPage()));
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: DottedBorder(
                    borderType: BorderType.Rect,
                    strokeWidth: 1,
                    color: Colors.green,
                    strokeCap: StrokeCap.butt,
                    child: Column(
                      children: [
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width * 0.90,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '100% Off extra on recharge of ₹50',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  height: 19,
                                  width: 19,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Icon(
                                    Icons.close_rounded,
                                    size: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.check,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                '₹50 cashback in JyotishBani wallet with this recharge',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      var _razorpay = Razorpay();
                      try {
                        
                        _razorpay.open(Constants().getRazorPayOptions(amount: totalAmount));
                        _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                            (PaymentSuccessResponse response) async {
                          print(
                              'Payment Success Response: ${response.toString()}');
                          await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionCompleted(
                                        isTransactionCompleted: true,
                                      )));
                        });

                        _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                            (PaymentFailureResponse response) async {
                          print(
                              'Payment Error Response: ${response.toString()}');
                          await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionCompleted(
                                        isTransactionCompleted: false,
                                      )));
                        });

                        _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                            (ExternalWalletResponse response) async {
                          print(
                              'Payment Error Response: ${response.toString()}');
                        });
                      } catch (e) {
                        print('Catch Error: $e');
                        _razorpay.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 123, 216),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'Proceed to Pay',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: const [
              //     Text(
              //       'Recommended Methods',
              //       style: TextStyle(
              //         fontSize: 15,
              //         color: Colors.white,
              //       ),
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       color: Colors.white.withOpacity(0.1),
              //       borderRadius: BorderRadius.circular(1)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       RadioMenuButton(
              //         value: 1,
              //         groupValue: 4,
              //         onChanged: (index) {
              //           setState(() {});
              //         },
              //         child: Row(
              //           children: [
              //             Image.asset(
              //               'assets/images/Upi.png',
              //               height: 25,
              //               width: 25,
              //             ),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             const Text(
              //               'UPI',
              //               style: TextStyle(color: Colors.white, fontSize: 16),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: const [
              //     Text(
              //       'Other Payment Methods',
              //       style: TextStyle(
              //         fontSize: 15,
              //         color: Colors.white,
              //       ),
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       color: Colors.white.withOpacity(0.1),
              //       borderRadius: BorderRadius.circular(1)),
              //   child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         RadioMenuButton(
              //           value: 1,
              //           groupValue: 4,
              //           onChanged: (index) {
              //             setState(() {});
              //           },
              //           child: Row(
              //             children: [
              //               Image.asset(
              //                 'assets/images/credit-card.png',
              //                 height: 25,
              //                 width: 25,
              //               ),
              //               const SizedBox(
              //                 width: 10,
              //               ),
              //               const Text(
              //                 'Credit/Debit Card',
              //                 style:
              //                     TextStyle(color: Colors.white, fontSize: 16),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ]),
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       color: Colors.white.withOpacity(0.1),
              //       borderRadius: BorderRadius.circular(1)),
              //   child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         RadioMenuButton(
              //             value: 1,
              //             groupValue: 4,
              //             onChanged: (index) {
              //               setState(() {});
              //             },
              //             child: Row(
              //               children: [
              //                 Image.asset(
              //                   'assets/images/bank.png',
              //                   height: 25,
              //                   width: 25,
              //                 ),
              //                 const SizedBox(
              //                   width: 10,
              //                 ),
              //                 const Text(
              //                   'Net Banking',
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 16),
              //                 )
              //               ],
              //             ))
              //       ]),
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       color: Colors.white.withOpacity(0.1),
              //       borderRadius: BorderRadius.circular(1)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       RadioMenuButton(
              //         value: 1,
              //         groupValue: 4,
              //         onChanged: (index) {
              //           setState(() {});
              //         },
              //         child: Row(
              //           children: [
              //             Image.asset(
              //               'assets/images/razorpay-icon 1.png',
              //               height: 20,
              //               width: 20,
              //             ),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             const Text(
              //               'RazorPay',
              //               style: TextStyle(color: Colors.white, fontSize: 16),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
