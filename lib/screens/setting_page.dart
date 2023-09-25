import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String selectedLanguage = "English";
  bool dropDown = false;
  // ignore: non_constant_identifier_names
  bool chat_status = false;
  // ignore: non_constant_identifier_names
  bool audio_call_status = false;
  // ignore: non_constant_identifier_names
  bool video_call_status = false;
  // ignore: non_constant_identifier_names
  bool live_event = false;

  // var _listvartical = ["Vartical 1", "Vartical 2", "HVartical 3"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const HadLineP(
                text: 'Setting',
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 15, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Chat',
                          style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 108, 108, 108)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FlutterSwitch(
                          width: 40,
                          height: 20,
                          activeColor: Colors.white.withOpacity(0.2),
                          inactiveToggleColor: Colors.white,
                          inactiveColor: Colors.white.withOpacity(0.2),
                          activeToggleColor: Colors.green,
                          valueFontSize: 10,
                          value: chat_status,
                          borderRadius: 15,
                          toggleSize: 10.0,
                          activeTextColor: Colors.white,
                          showOnOff: true,
                          onToggle: (sStatus) {
                            setState(() {
                              chat_status = sStatus;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Audio Call',
                          style: TextStyle(
                              fontSize: 15,

                              // fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 108, 108, 108)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FlutterSwitch(
                          width: 40,
                          height: 20,
                          activeColor: Colors.white.withOpacity(0.2),
                          inactiveToggleColor: Colors.white,
                          inactiveColor: Colors.white.withOpacity(0.2),
                          activeToggleColor: Colors.green,
                          valueFontSize: 10,
                          value: audio_call_status,
                          borderRadius: 15,
                          toggleSize: 10.0,
                          activeTextColor: Colors.white,
                          showOnOff: true,
                          onToggle: (sStatus) {
                            setState(() {
                              audio_call_status = sStatus;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Video Call',
                          style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 108, 108, 108)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FlutterSwitch(
                          width: 40,
                          height: 20,
                          activeColor: Colors.white.withOpacity(0.2),
                          inactiveToggleColor: Colors.white,
                          inactiveColor: Colors.white.withOpacity(0.2),
                          activeToggleColor: Colors.green,
                          valueFontSize: 10,
                          value: video_call_status,
                          borderRadius: 15,
                          toggleSize: 10.0,
                          activeTextColor: Colors.white,
                          showOnOff: true,
                          onToggle: (sStatus) {
                            setState(() {
                              video_call_status = sStatus;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Live Events',
                          style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 108, 108, 108)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FlutterSwitch(
                          width: 40,
                          height: 20,
                          activeColor: Colors.white.withOpacity(0.2),
                          inactiveToggleColor: Colors.white,
                          inactiveColor: Colors.white.withOpacity(0.2),
                          activeToggleColor: Colors.green,
                          valueFontSize: 10,
                          value: live_event,
                          borderRadius: 15,
                          toggleSize: 10.0,
                          activeTextColor: Colors.white,
                          showOnOff: true,
                          onToggle: (sStatus) {
                            setState(() {
                              live_event = sStatus;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Change App Language',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        // margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10)),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                selectedLanguage,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  dropDown = !dropDown;
                                });
                              },
                              icon: Icon(
                                dropDown
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 33,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    dropDown
                        ? RadioB(
                            onSelectLanguage: (String value) {
                              setState(() {
                                selectedLanguage = value;
                                dropDown = false;
                              });
                            },
                            initialValue: selectedLanguage,
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                    // const RadioB(),
                    const SizedBox(
                      height: 20,
                    ),
                    const SPage(
                      text: 'Terms and Conditions',
                      icon: Icons.abc_outlined,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SPage(
                      text: 'Privacy Policy',
                      icon: Icons.privacy_tip_outlined,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SPage(
                      text: 'Delete My Account',
                      icon: Icons.delete_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
