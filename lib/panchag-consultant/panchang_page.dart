import 'package:astrology_app/controllers/controllers.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';

class PanchangPage extends StatefulWidget {
  const PanchangPage({super.key});

  @override
  State<PanchangPage> createState() => _PanchangPageState();
}

class _PanchangPageState extends State<PanchangPage> {
  final _dateController = TextEditingController();
  bool _currentMuharatClicked = false;
  bool _todayPanchagClicked = false;
  bool _sunandmoonClicked = false;
  bool _hinduMonthandYearClicked = false;
  bool _auspiciousClicked = false;
  DateTime selectedDate = DateTime.now();
  bool dataLoaded = false;
  late dynamic data;

  Future<void> getPanchangData() async {
    
      data = await Controller.getPanchagData();
      if(data != null){
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       data.toString(),
      //       style: const TextStyle(fontSize: 20),
      //     ),
      //   ),
      // );
      }
    
  }

  @override
  void initState() {
    super.initState();
    getPanchangData().whenComplete(() {
      setState(() {
        dataLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: dataLoaded
            ? (data == null)
                ? const Center(
                    child: Text("Failed to load Panchang Data"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const HadLineP(text: 'Panchang'),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 55,
                                width: MediaQuery.of(context).size.width * 0.59,
                                child: InkWell(
                                  onTap: () {
                                    _selectDate();
                                  },
                                  child: TextField(
                                    controller: _dateController,
                                    enabled: false,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      prefixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.keyboard_arrow_left,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                      filled: true,
                                      fillColor: Colors.black.withOpacity(0.2),
                                      disabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 55,
                                  width:
                                      MediaQuery.of(context).size.width * 0.31,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.99,
                            // height: 20,
                            // width: 30,
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade800,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/moon.png',
                                        height: 50,
                                        width: 60,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'TITHI',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // SizedBox(
                                          //   height: 10,
                                          // ),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          // Text(
                                          //   'TITHI',
                                          //   style: TextStyle(color: Colors.white),
                                          // ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        data['vaara'].toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                        // textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Prathama',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Start: Yesterday 10:08 AM\nEnd: 11:26 AM',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Text(
                                            'Jun 19, 2023',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            'Ashadha - Shukla',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        PanchangButton(
                          btText: 'Current Muhrat',
                          press: () {
                            setState(() {
                              _currentMuharatClicked = !_currentMuharatClicked;
                            });
                          },
                          isClicked: _currentMuharatClicked,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: _currentMuharatClicked
                              ? const Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Panchang(
                                          text: 'Chogadia',
                                          text1: 'Rog',
                                          text2: '08:33 AM to 10:14 AM',
                                          text3:
                                              'Auspicious for politics \nand Govt Job',
                                        ),
                                        Panchang(
                                          text: 'Hora',
                                          text1: 'Sun',
                                          text2: '08:33 AM to 09:40 AM',
                                          text3: 'Inauspicious',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangAuspi(
                                            text: 'Current Lagna',
                                            text1:
                                                "Leo (Fixed)\n09:37 AM to 11:48 AM"),
                                        SizedBox(),
                                        PanchangAuspi(
                                            text: 'Do Ghati',
                                            text1:
                                                "Vairaj (Sangav)\n09:40 AM to 10:34 AM"),
                                      ],
                                    ),
                                  ],
                                )
                              : const Spacer(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        PanchangButton(
                          btText: 'Today’s Panchang',
                          press: () {
                            setState(() {
                              _todayPanchagClicked = !_todayPanchagClicked;
                            });
                          },
                          isClicked: _todayPanchagClicked,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: _todayPanchagClicked
                              ? const Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Panchang(
                                          text: 'Tithi',
                                          text1: 'Chatursashi',
                                          text2: 'Till - 09:13 AM',
                                          text3: 'Next - Amavasya',
                                        ),
                                        SizedBox(width: 5),
                                        Panchang(
                                          text: 'Yoga',
                                          text1: 'Soola',
                                          text2: 'Till - Tomorrow 01:00 AM',
                                          text3: 'Next - Ganda',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Panchang(
                                          text: 'Nakshatra',
                                          text1: 'Rohini',
                                          text2: 'Till - 04:23 PM',
                                          text3: 'Next - Mrigashirsha',
                                        ),
                                        SizedBox(width: 5),
                                        Panchang(
                                          text: 'Nakshatra',
                                          text1: 'Rohini',
                                          text2: 'Till - 04:23 PM',
                                          text3: 'Next - Mrigashirsha',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangP(
                                            text: 'Paksha', text1: 'Krishna'),
                                        SizedBox(width: 5),
                                        PanchangP(
                                            text: 'Day', text1: 'Shanivara'),
                                      ],
                                    ),
                                  ],
                                )
                              : const Spacer(),
                        ),
                        const SizedBox(height: 15),
                        PanchangButton(
                          btText: 'Sun and Moon Calculations',
                          press: () {
                            setState(() {
                              _sunandmoonClicked = !_sunandmoonClicked;
                            });
                          },
                          isClicked: _sunandmoonClicked,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: _sunandmoonClicked
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangP(
                                            text: 'Sun Rise',
                                            text1: data['sunrise'].toString()),
                                        const SizedBox(width: 5),
                                        PanchangP(
                                          text: 'Sun Set',
                                          text1: data['sunset'].toString(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangP(
                                            text: 'Moon Rise',
                                            text1: data['moonrise'].toString()),
                                        SizedBox(width: 5),
                                        PanchangP(
                                            text: 'Moon Set',
                                            text1: data['moonset'].toString()),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangP(
                                            text: 'Ritu', text1: 'Grishma'),
                                        SizedBox(width: 5),
                                        PanchangP(
                                            text: 'Moon Sign',
                                            text1: 'Vrishabha'),
                                      ],
                                    ),
                                  ],
                                )
                              : const Spacer(),
                        ),
                        const SizedBox(height: 15),
                        PanchangButton(
                          btText: 'Hindu Month And Year',
                          press: () {
                            setState(() {
                              _hinduMonthandYearClicked =
                                  !_hinduMonthandYearClicked;
                            });
                          },
                          isClicked: _hinduMonthandYearClicked,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: _hinduMonthandYearClicked
                              ? const Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangP(
                                            text: 'Shaka Samvat',
                                            text1: '05:11 AM'),
                                        SizedBox(width: 5),
                                        PanchangP(
                                            text: 'Day Duration',
                                            text1: '13:26:15'),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangP(
                                            text: 'Kali Samvat', text1: '5125'),
                                        SizedBox(width: 5),
                                        PanchangP(
                                            text: 'Vikram Samvat',
                                            text1: '2080'),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangP(
                                            text: 'Month Amanta',
                                            text1: 'Jyeshtha'),
                                        SizedBox(width: 5),
                                        PanchangP(
                                            text: 'Month Purnimanta',
                                            text1: 'Ashadha'),
                                      ],
                                    ),
                                  ],
                                )
                              : const Spacer(),
                        ),
                        const SizedBox(height: 15),
                        PanchangButton(
                          btText: 'Auspicious/Inauspicious Time',
                          press: () {
                            setState(() {
                              _auspiciousClicked = !_auspiciousClicked;
                            });
                          },
                          isClicked: _auspiciousClicked,
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: _auspiciousClicked
                              ? const Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PanchangAuspi(
                                            text: 'Abhijit',
                                            text1: "11:28 AM - \n12:21 PM"),
                                        SizedBox(width: 5),
                                        PanchangAuspi(
                                            text: 'Dushta Muhurtas',
                                            text1:
                                                "05:11 AM, 06:05 AM\n06:05 AM, 06:59 AM"),
                                      ],
                                    ),
                                  ],
                                )
                              : const Spacer(),
                        ),
                      ],
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  // : const Center(
  //                   child: Text("Failed to load Panchag data"),
  //                 )

  // Future<void> _selectDate(BuildContext context) async {
  //   String formatDate;
  //   DateTime? pickedDate = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1800),
  //       lastDate: DateTime(3000));
  //   if (pickedDate != null && pickedDate != selectedDate) {
  //     setState(() {
  //       selectedDate = pickedDate;
  //       formatDate ="${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}";
  //       _dateController.text = formatDate.toString();
  //     });
  //   }
  // }

  // SizedBox(
  //         height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //         child: FutureBuilder(
  //           future: Controller.getPanchagData(),
  //           builder: (BuildContext context, AsyncSnapshot snapshot) {
  //             if (snapshot.connectionState == ConnectionState.waiting) {
  //               return const Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                    Center(
  //                     child: CircularProgressIndicator(),
  //                   ),
  //                 ],
  //               );
  //             } else if (snapshot.hasError) {
  //               return Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   const Spacer(),
  //                   Text(
  //                     "Error: ${snapshot.error}",
  //                     style: const TextStyle(color: Colors.white),
  //                   ),
  //                   const Spacer(),
  //                 ],
  //               );
  //             } else {
  //               return SingleChildScrollView(
  //                 child: Column(
  //                   children: [
  //                     const HadLineP(text: 'Panchang'),
  //                     Padding(
  //                       padding: const EdgeInsets.only(left: 15, right: 15),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           SizedBox(
  //                             height: 55,
  //                             width: MediaQuery.of(context).size.width * 0.59,
  //                             child: InkWell(
  //                               onTap: () {
  //                                 _selectDate();
  //                               },
  //                               child: TextField(
  //                                 controller: _dateController,
  //                                 enabled: false,
  //                                 style: const TextStyle(color: Colors.white),
  //                                 decoration: InputDecoration(
  //                                   prefixIcon: IconButton(
  //                                     icon: const Icon(
  //                                       Icons.keyboard_arrow_left,
  //                                       size: 30,
  //                                       color: Colors.white,
  //                                     ),
  //                                     onPressed: () {},
  //                                   ),
  //                                   suffixIcon: IconButton(
  //                                     icon: const Icon(
  //                                       Icons.keyboard_arrow_right,
  //                                       size: 30,
  //                                       color: Colors.white,
  //                                     ),
  //                                     onPressed: () {},
  //                                   ),
  //                                   filled: true,
  //                                   fillColor: Colors.black.withOpacity(0.2),
  //                                   disabledBorder: const OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                         color: Colors.white,
  //                                       ),
  //                                       borderRadius: BorderRadius.all(
  //                                           Radius.circular(15))),
  //                                   border: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(10)),
  //                                   enabledBorder: const OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                         color: Colors.white,
  //                                       ),
  //                                       borderRadius: BorderRadius.all(
  //                                           Radius.circular(15))),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 5,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {},
  //                             child: Container(
  //                               height: 55,
  //                               width: MediaQuery.of(context).size.width * 0.31,
  //                               decoration: BoxDecoration(
  //                                   border: Border.all(color: Colors.white),
  //                                   borderRadius: BorderRadius.circular(15)),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(12.0),
  //                       child: Container(
  //                         height: MediaQuery.of(context).size.height * 0.18,
  //                         width: MediaQuery.of(context).size.width * 0.99,
  //                         // height: 20,
  //                         // width: 30,
  //                         decoration: BoxDecoration(
  //                           color: Colors.indigo.shade800,
  //                           borderRadius: BorderRadius.circular(20),
  //                         ),
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(12.0),
  //                           child: Column(
  //                             children: [
  //                               Row(
  //                                 children: [
  //                                   Image.asset(
  //                                     'assets/images/moon.png',
  //                                     height: 50,
  //                                     width: 60,
  //                                   ),
  //                                   const Column(
  //                                     mainAxisAlignment: MainAxisAlignment.start,
  //                                     children: [
  //                                       Text(
  //                                         'TITHI',
  //                                         style: TextStyle(
  //                                             color: Colors.white,
  //                                             fontSize: 18,
  //                                             fontWeight: FontWeight.bold),
  //                                       ),
  //                                       // SizedBox(
  //                                       //   height: 10,
  //                                       // ),
  //                                       Text(
  //                                         '1',
  //                                         style: TextStyle(
  //                                             color: Colors.white,
  //                                             fontSize: 18,
  //                                             fontWeight: FontWeight.bold),
  //                                       ),

  //                                       // Text(
  //                                       //   'TITHI',
  //                                       //   style: TextStyle(color: Colors.white),
  //                                       // ),
  //                                     ],
  //                                   ),
  //                                   const Spacer(),
  //                                   const Text(
  //                                     'Somavara',
  //                                     style: TextStyle(
  //                                         color: Colors.white,
  //                                         fontSize: 19,
  //                                         fontWeight: FontWeight.bold),
  //                                     // textAlign: TextAlign.end,
  //                                   ),
  //                                 ],
  //                               ),
  //                               const Row(
  //                                 children: [
  //                                   Column(
  //                                     children: [
  //                                       Text(
  //                                         'Prathama',
  //                                         style: TextStyle(
  //                                             color: Colors.white,
  //                                             fontSize: 18,
  //                                             fontWeight: FontWeight.bold),
  //                                       ),
  //                                       Text(
  //                                         'Start: Yesterday 10:08 AM\nEnd: 11:26 AM',
  //                                         style: TextStyle(
  //                                             color: Colors.white, fontSize: 14),
  //                                         textAlign: TextAlign.center,
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   Spacer(),
  //                                   Column(
  //                                     children: [
  //                                       Text(
  //                                         'Jun 19, 2023',
  //                                         style: TextStyle(
  //                                           color: Colors.white,
  //                                           fontSize: 14,
  //                                         ),
  //                                       ),
  //                                       Text(
  //                                         'Ashadha - Shukla',
  //                                         style: TextStyle(
  //                                             color: Colors.white, fontSize: 14),
  //                                         textAlign: TextAlign.center,
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     PanchangButton(
  //                       btText: 'Current Muhrat',
  //                       press: () {
  //                         setState(() {
  //                           _currentMuharatClicked = !_currentMuharatClicked;
  //                         });
  //                       },
  //                       isClicked: _currentMuharatClicked,
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(15),
  //                       child: _currentMuharatClicked
  //                           ? const Column(
  //                               children: [
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Panchang(
  //                                       text: 'Chogadia',
  //                                       text1: 'Rog',
  //                                       text2: '08:33 AM to 10:14 AM',
  //                                       text3:
  //                                           'Auspicious for politics \nand Govt Job',
  //                                     ),
  //                                     Panchang(
  //                                       text: 'Hora',
  //                                       text1: 'Sun',
  //                                       text2: '08:33 AM to 09:40 AM',
  //                                       text3: 'Inauspicious',
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 15),
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangAuspi(
  //                                         text: 'Current Lagna',
  //                                         text1:
  //                                             "Leo (Fixed)\n09:37 AM to 11:48 AM"),
  //                                     SizedBox(),
  //                                     PanchangAuspi(
  //                                         text: 'Do Ghati',
  //                                         text1:
  //                                             "Vairaj (Sangav)\n09:40 AM to 10:34 AM"),
  //                                   ],
  //                                 ),
  //                               ],
  //                             )
  //                           : const Spacer(),
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     PanchangButton(
  //                       btText: 'Today’s Panchang',
  //                       press: () {
  //                         setState(() {
  //                           _todayPanchagClicked = !_todayPanchagClicked;
  //                         });
  //                       },
  //                       isClicked: _todayPanchagClicked,
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(15),
  //                       child: _todayPanchagClicked
  //                           ? const Column(
  //                               children: [
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Panchang(
  //                                       text: 'Tithi',
  //                                       text1: 'Chatursashi',
  //                                       text2: 'Till - 09:13 AM',
  //                                       text3: 'Next - Amavasya',
  //                                     ),
  //                                     SizedBox(width: 5),
  //                                     Panchang(
  //                                       text: 'Yoga',
  //                                       text1: 'Soola',
  //                                       text2: 'Till - Tomorrow 01:00 AM',
  //                                       text3: 'Next - Ganda',
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 15),
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Panchang(
  //                                       text: 'Nakshatra',
  //                                       text1: 'Rohini',
  //                                       text2: 'Till - 04:23 PM',
  //                                       text3: 'Next - Mrigashirsha',
  //                                     ),
  //                                     SizedBox(width: 5),
  //                                     Panchang(
  //                                       text: 'Nakshatra',
  //                                       text1: 'Rohini',
  //                                       text2: 'Till - 04:23 PM',
  //                                       text3: 'Next - Mrigashirsha',
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 15),
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangP(text: 'Paksha', text1: 'Krishna'),
  //                                     SizedBox(width: 5),
  //                                     PanchangP(text: 'Day', text1: 'Shanivara'),
  //                                   ],
  //                                 ),
  //                               ],
  //                             )
  //                           : const Spacer(),
  //                     ),
  //                     const SizedBox(height: 15),
  //                     PanchangButton(
  //                       btText: 'Sun and Moon Calculations',
  //                       press: () {
  //                         setState(() {
  //                           _sunandmoonClicked = !_sunandmoonClicked;
  //                         });
  //                       },
  //                       isClicked: _sunandmoonClicked,
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.all(15),
  //                       child: _sunandmoonClicked
  //                           ? const Column(
  //                               children: [
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangP(
  //                                         text: 'Sun Rise', text1: '05:11 AM'),
  //                                     SizedBox(width: 5),
  //                                     PanchangP(
  //                                         text: 'Sun Set', text1: '06:38 PM'),
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 15),
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangP(
  //                                         text: 'Moon Rise', text1: '04:56 AM'),
  //                                     SizedBox(width: 5),
  //                                     PanchangP(
  //                                         text: 'Moon Set', text1: '06:01 PM'),
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 15),
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangP(text: 'Ritu', text1: 'Grishma'),
  //                                     SizedBox(width: 5),
  //                                     PanchangP(
  //                                         text: 'Moon Sign', text1: 'Vrishabha'),
  //                                   ],
  //                                 ),
  //                               ],
  //                             )
  //                           : const Spacer(),
  //                     ),
  //                     const SizedBox(height: 15),
  //                     PanchangButton(
  //                       btText: 'Hindu Month And Year',
  //                       press: () {
  //                         setState(() {
  //                           _hinduMonthandYearClicked =
  //                               !_hinduMonthandYearClicked;
  //                         });
  //                       },
  //                       isClicked: _hinduMonthandYearClicked,
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(15),
  //                       child: _hinduMonthandYearClicked
  //                           ? const Column(
  //                               children: [
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangP(
  //                                         text: 'Shaka Samvat',
  //                                         text1: '05:11 AM'),
  //                                     SizedBox(width: 5),
  //                                     PanchangP(
  //                                         text: 'Day Duration',
  //                                         text1: '13:26:15'),
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 15),
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangP(
  //                                         text: 'Kali Samvat', text1: '5125'),
  //                                     SizedBox(width: 5),
  //                                     PanchangP(
  //                                         text: 'Vikram Samvat', text1: '2080'),
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 15),
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangP(
  //                                         text: 'Month Amanta',
  //                                         text1: 'Jyeshtha'),
  //                                     SizedBox(width: 5),
  //                                     PanchangP(
  //                                         text: 'Month Purnimanta',
  //                                         text1: 'Ashadha'),
  //                                   ],
  //                                 ),
  //                               ],
  //                             )
  //                           : const Spacer(),
  //                     ),
  //                     const SizedBox(height: 15),
  //                     PanchangButton(
  //                       btText: 'Auspicious/Inauspicious Time',
  //                       press: () {
  //                         setState(() {
  //                           _auspiciousClicked = !_auspiciousClicked;
  //                         });
  //                       },
  //                       isClicked: _auspiciousClicked,
  //                     ),
  //                     const SizedBox(height: 15),
  //                     Padding(
  //                       padding: const EdgeInsets.all(15),
  //                       child: _auspiciousClicked
  //                           ? const Column(
  //                               children: [
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     PanchangAuspi(
  //                                         text: 'Abhijit',
  //                                         text1: "11:28 AM - \n12:21 PM"),
  //                                     SizedBox(width: 5),
  //                                     PanchangAuspi(
  //                                         text: 'Dushta Muhurtas',
  //                                         text1:
  //                                             "05:11 AM, 06:05 AM\n06:05 AM, 06:59 AM"),
  //                                   ],
  //                                 ),
  //                               ],
  //                             )
  //                           : const Spacer(),
  //                     ),
  //                   ],
  //                 ),
  //               );
  //             }
  //           },
  //         ),
  //       ),

  Future _selectDate() async {
    String formattedDate;
    selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate =
            " ${selectedDate!.day} - ${monthInttoString(selectedDate!.month)} - ${selectedDate!.year} ";
        _dateController.text = formattedDate.toString();
        // log("message ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}");
      });
    }
  }

  String monthInttoString(int monthInt) {
    switch (monthInt) {
      case 1:
        {
          return 'Jan';
        }
      case 2:
        {
          return 'Feb';
        }
      case 3:
        {
          return 'Mar';
        }
      case 4:
        {
          return 'Apr';
        }

      case 5:
        {
          return 'May';
        }

      case 6:
        {
          return 'Jun';
        }

      case 7:
        {
          return 'Jul';
        }

      case 8:
        {
          return 'Aug';
        }

      case 9:
        {
          return 'Sept';
        }

      case 10:
        {
          return 'Oct';
        }
      case 11:
        {
          return 'Nov';
        }

      case 12:
        {
          return 'Dec';
        }

      default:
        {
          return '';
        }
    }
  }
}
