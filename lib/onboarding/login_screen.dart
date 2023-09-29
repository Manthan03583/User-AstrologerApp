import 'package:astrology_app/controllers/controllers.dart';
import 'package:astrology_app/onboarding/otp_verify.dart';
import 'package:astrology_app/utils/routes.dart';
import 'package:astrology_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/background_img.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formKey;
  TextEditingController mobileNumberController = TextEditingController();
  String validMessage = '';

  

  Future<void> login() async {
    //print(mobileNumberController.text);
    final data = await Controller.userLogin(mobileNumberController.text);

    
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(data['message'].toString()),
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    //height: 100,
                    alignment: Alignment.center,
                    //margin: const EdgeInsets.only(top: 80),
                    child: Text(
                      "JyotishBani",
                      style: GoogleFonts.aclonica(
                          color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  //margin: const EdgeInsets.only(top: 100),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18)),
                    //border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-4, -4),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  width: 500,
                  height: MediaQuery.of(context).size.height * 0.52,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Hi, Welcome",
                              style: GoogleFonts.alike(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Submit your mobile number",
                                style:
                                    GoogleFonts.actor(color: Colors.grey[700]),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Row(children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Divider(
                                color: Colors.grey[700],
                              ),
                            )),
                            Text(
                              "Log in or sign up",
                              style: GoogleFonts.actor(color: Colors.grey[600]),
                            ),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Divider(
                                color: Colors.grey[700],
                              ),
                            )),
                          ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 18,
                          ),
                          //padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          //height: 40,
                          child: IntlPhoneField(
                            controller: mobileNumberController,
                            decoration: const InputDecoration(
                              counter: Offstage(),
                              labelText: 'Mobile Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            invalidNumberMessage: validMessage,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            initialCountryCode: 'IN',
                            showDropdownIcon: true,
                            dropdownIconPosition: IconPosition.trailing,
                            flagsButtonPadding: const EdgeInsets.all(8),
                            // focusNode: FocusNode(onKeyEvent: (node, event) {
                            //   FocusScope.of(context).unfocus();
                            // },),
                            validator: (phoneNumber) {
                              final phone = phoneNumber.toString();
                              if (phoneNumber == null || phone.trim().isEmpty) {
                                setState(() {
                                  validMessage =
                                      'Please enter your phone number';
                                });
                              }

                              final cleanedPhoneNumber =
                                  phone.replaceAll(' ', '');

                              if (!RegExp(r'^[6789]\d{9}$')
                                  .hasMatch(cleanedPhoneNumber)) {
                                setState(() {
                                  validMessage =
                                      'Please enter a valid 10-digit phone number';
                                });
                              } else if (cleanedPhoneNumber.length == 10) {
                                SystemChannels.textInput
                                    .invokeMethod('TextInput.hide');
                              }

                              return null;
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () async{
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            if (_formKey.currentState!.validate()) {
                              final cleanedPhoneNumber = mobileNumberController
                                  .text
                                  .replaceAll(RegExp(r'\D'), '');

                              if (cleanedPhoneNumber.isNotEmpty &&
                                  cleanedPhoneNumber.length == 10) {
                                    await login().then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpScreen(
                                      phoneNumber: cleanedPhoneNumber,
                                    ),
                                  ),
                                ));
                                
                              } else if (cleanedPhoneNumber == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Please enter a phone number"),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Please enter a valid 10-digit phone number"),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }
                            }

                            
                          },
                          child: PrimaryButton(
                              text: Center(
                            child: Text(
                              "Request OTP",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Row(children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Divider(
                                color: Colors.grey[700],
                              ),
                            )),
                            Text(
                              "Or",
                              style: GoogleFonts.actor(color: Colors.grey[600]),
                            ),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Divider(
                                color: Colors.grey[700],
                              ),
                            )),
                          ]),
                        ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: SecondaryButton(
                        //       text: Center(
                        //           child: Text(
                        //     "Continue with email",
                        //     style: GoogleFonts.aBeeZee(
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold,
                        //         letterSpacing: 1),
                        //   ))),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    // width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Image.asset(
                                "assets/images/google.png",
                                height: 25,
                                width: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    // width: 2
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Image.asset(
                                "assets/images/dot.png",
                                height: 25,
                                width: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                Text(
                                  "By continuing, you agree to our  ",
                                  style: GoogleFonts.actor(
                                      color: Colors.grey[700], fontSize: 13),
                                ),
                                // const SizedBox(width: 3,),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Terms and Privacy policy",
                                    style: GoogleFonts.actor(
                                        color: Colors.blue[700],
                                        fontSize: 13,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
