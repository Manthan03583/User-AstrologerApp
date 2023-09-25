import 'package:astrology_app/Wallet/add_money.dart';
import 'package:astrology_app/Wallet/payment_information_page.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';

class MoneyWalletPage extends StatefulWidget {
  const MoneyWalletPage({super.key});

  @override
  State<MoneyWalletPage> createState() => _MoneyWalletPageState();
}

class _MoneyWalletPageState extends State<MoneyWalletPage> {
  late final TextEditingController _amountController;
  int selectedIndex = -1;
  late double amount;

  @override
  void initState() {
    _amountController = TextEditingController();

    amount = 0;
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    amount = 0;
    super.dispose();
  }

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
                  text: 'Add Money to Wallet',
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Available Balance',
                        style: TextStyle(
                          color: Color.fromARGB(255, 116, 115, 115),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '₹ 9',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 116, 115, 115),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select the recharge amount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: amountSelect.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        amount = amountSelect[index].amount;
                        _amountController.text =
                            amountSelect[index].amount.toInt().toString();

                        // amountSelect[index].clicked = true;
                        // if (previousIndex != -1 && (previousIndex != index)) {
                        //   amountSelect[previousIndex].clicked = false;
                        // }
                        // previousIndex = index;
                        // amountSelect[index]
                        selectedIndex = index;
                      });
                    },
                    child: AmountSelect(
                      amountText: amountSelect[index].amountText,
                      offer: amountSelect[index].offer,
                      color: amountSelect[index].color,
                      amount: amountSelect[index].amount,
                      index: index,
                      selectedIndex: selectedIndex,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _amountController,
                      enabled: false,
                      keyboardType: TextInputType.none,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter amount',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Color.fromARGB(255, 143, 129, 3),
                        size: 19,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Note : Recharging begins at a minimum of ₹50.  ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 143, 129, 3),
                          fontSize: 13.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (amount == 0) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          'Please select the amount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PaymentInformationPage(amount: amount)));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 123, 216),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
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
