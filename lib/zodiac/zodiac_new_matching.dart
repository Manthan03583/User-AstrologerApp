import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';

class ZodiacNewMatching extends StatefulWidget {
  const ZodiacNewMatching({super.key});

  @override
  State<ZodiacNewMatching> createState() => _ZodiacNewMatchingState();
}

class _ZodiacNewMatchingState extends State<ZodiacNewMatching> {
  DateTime selectedDate = DateTime.now();

  final _boyNameController = TextEditingController();
  final _boyDobController = TextEditingController();

  final _girlNameController = TextEditingController();
  final _girlDobController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Boy’s Details",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    KundliMachingPage(
                      text: 'Name',
                      text1: 'Enter Name',
                      icon: Icons.person,
                      passController: _boyNameController,
                      press: () {},
                      validation: (String? value) {
                        if (value == null || value == '') {
                          return "Enter a Valid Name";
                        } else {
                          final isValid = RegExp(
                                  r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                              .hasMatch(value!);
                          if (!isValid) {
                            return 'Enter a valid name';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    KundliMachingPage(
                      text: 'Birth date',
                      text1: 'Enter Birthdate',
                      icon: Icons.calendar_month_outlined,
                      passController: _boyDobController,
                      press: () {
                        setState(() {
                          _selectDate(context, true);
                        });
                      },
                      validation: (String? value) {
                        if (value == null || value == '') {
                          return "Enter a Valid Birth Date";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Girl’s Details",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    KundliMachingPage(
                      text: 'Name',
                      text1: 'Enter Name',
                      icon: Icons.person,
                      passController: _girlNameController,
                      press: () {},
                      validation: (String? value) {
                        if (value == null || value == '') {
                          return "Enter a Valid Name";
                        } else {
                          final isValid = RegExp(
                                  r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                              .hasMatch(value!);
                          if (!isValid) {
                            return 'Enter a valid Name';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    KundliMachingPage(
                      text: 'Birth date',
                      text1: 'Enter Birthdate',
                      icon: Icons.calendar_month_outlined,
                      passController: _girlDobController,
                      press: () {
                        setState(() {
                          _selectDate(context, false);
                        });
                      },
                      validation: (String? value) {
                        if (value == null || value == '') {
                          return "Enter a Valid Birth Date";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          _boyNameController.clear();
                          _boyDobController.clear();
                          _girlNameController.clear();
                          _girlDobController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 10, 123, 216),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text(
                          'Get Match Details',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isBoy) async {
    String formatDate;
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1800),
        lastDate: DateTime(3000));
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        formatDate =
            "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}";
        if (isBoy) {
          _boyDobController.text = formatDate.toString();
        } else {
          _girlDobController.text = formatDate.toString();
        }
      });
    }
  }
}