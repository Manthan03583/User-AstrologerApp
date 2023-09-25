import 'package:astrology_app/Wallet/money_wallet_page.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';

class AddWalletPage extends StatefulWidget {
  const AddWalletPage({super.key});

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [            
                const HadLineP(
                  text: 'Add To Wallet'
                ),
          
                const SizedBox(
                  height: 100,
                ),
          
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MoneyWalletPage()));
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Enter the amount you want to Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
          
                const Row(
                  children: [
                    Text(
                      'Enter amount ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 120,
                ),

                Container(
                  height: MediaQuery.of(context).size.height*0.40,
                  width: MediaQuery.of(context).size.width*0.90,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(left: 15,top: 15,right: 15,bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pay by UPI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.close,
                              size: 22,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children:  [
                                  Row(
                                    children: const [
                                      Text(
                                        'Select UPI app',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],                      
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                            
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/1.png',
                                            height: 35,
                                            width: 35,
                                          ),
                                          const Text(
                                            'Google Pay',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                            
                                      const SizedBox(
                                        width: 15,
                                      ),
                            
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.10,
                                        width: MediaQuery.of(context).size.width*0.20,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.only(top: 15,bottom: 15),
                                          child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/2.png',
                                              height: 30,
                                              width: 30,
                                            ),
                                            const Text(
                                              'Phonepe',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                          ),
                                        ),
                                     ),
                            
                                      const SizedBox(
                                        width: 15,
                                      ),
                            
                                      Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/3.png',
                                            height: 35,
                                            width: 35,
                                          ),
                                          const Text(
                                            'Paytm',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                            
                                      const SizedBox(
                                        width: 15,
                                      ),
                            
                                      Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/4.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                          const SizedBox(height: 10,),
                                          const Text(
                                            'Others',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                            
                                  const SizedBox(
                                    height: 10,
                                  ),
                            
                                  const Text(
                                    'Pay with installed app, or use others',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                            
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      
                      const SelectB()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}