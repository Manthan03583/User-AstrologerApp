import 'package:astrology_app/constants/keys.dart';
import 'package:astrology_app/controllers/controllers.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:get/get_connect/connect.dart';
import 'package:google_maps_webservice/places.dart';
// import 'kundliclass.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

//import '../class/kundliclass.dart';

class NewMatchingNM extends StatefulWidget {
  const NewMatchingNM({super.key});

  @override
  State<NewMatchingNM> createState() => _NewMatchingNMState();
}

class _NewMatchingNMState extends State<NewMatchingNM> {
  static const kGoogleApiKey = Constants.googleApiKey;
  GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

  final TextEditingController _boyDobController = TextEditingController();
  final TextEditingController _girlDobController = TextEditingController();
  final TextEditingController _boyTobController = TextEditingController();
  final TextEditingController _girlTobController = TextEditingController();

  final TextEditingController _boyNameController = TextEditingController();
  String _boyDob = '';
  String _boyTob = '';
  final TextEditingController _boyPobController = TextEditingController();
  late String boyLong;
  late String boyLati;

  final TextEditingController _girlNameController = TextEditingController();
  String _girlDob = '';
  String _girlTob = '';
  final TextEditingController _girlPobController = TextEditingController();
  late String girlLong;
  late String girlLati;

  late final String boyId;
  late final String girlId;
  final formKey = GlobalKey<FormState>();

  Future<void> dataCall() async {
    
      final matchData = await Controller.matchKundli(
          _boyPobController.text,
          "1",
          _boyDob,
          _boyTob,
          boyLong,
          boyLati,
          _girlNameController.text,
          "2",
          _girlDob,
          _girlTob,
          girlLong,
          girlLati);
          if(matchData.isNotEmpty){
           ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            matchData['message']['description'].toString(),
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      ); 
          }
      
     else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something Went Wrong',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      );
    }
  }

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
                padding: const EdgeInsets.only(right: 25, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Boy's Details",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
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

                    // const SizedBox(
                    //   height: 20,
                    // ),
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

                    // const SizedBox(
                    //   height: 20,
                    // ),
                    KundliMachingPage(
                      text: 'Birth time',
                      text1: 'Enter Birthtime',
                      icon: Icons.access_time_rounded,
                      passController: _boyTobController,
                      press: () {
                        setState(() {
                          _selectTime(context, true);
                        });
                      },
                      validation: (String? value) {
                        if (value == null || value == '') {
                          return "Enter a Valid Birth time";
                        }
                      },
                    ),

                    // const SizedBox(
                    //   height: 20,
                    // ),
                    KundliMachingPage(
                      text: 'Birth place',
                      text1: 'Enter Birthplace',
                      icon: Icons.location_on_outlined,
                      passController: _boyPobController,
                      press: () {
                        setState(() {
                          fetchPlaces(context, true);
                        });
                      },
                      validation: (String? value) {
                        if (value == null || value == '') {
                          return "Enter a Valid Birth Place";
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
                            return 'Enter a valid name';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),

                    // const SizedBox(
                    //   height: 20,
                    // ),
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

                    // const SizedBox(
                    //   height: 20,
                    // ),
                    KundliMachingPage(
                      text: 'Birth time',
                      text1: 'Enter Birthtime',
                      icon: Icons.access_time_rounded,
                      passController: _girlTobController,
                      press: () {
                        setState(() {
                          _selectTime(context, false);
                        });
                      },
                      validation: (String? value) {
                        if (value == null || value == '') {
                          return "Enter a Valid Birth Time";
                        }
                      },
                    ),

                    // const SizedBox(
                    //   height: 20,
                    // ),
                    KundliMachingPage(
                      text: 'Birth place',
                      text1: 'Enter Birthplace',
                      icon: Icons.location_on_outlined,
                      passController: _girlPobController,
                      press: () {
                        setState(() {
                          fetchPlaces(context, false);
                        });
                      },
                      validation: (String? value) {
                        if (value == null || value == '') {
                          return "Enter a Valid Birth Place";
                        }
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // dataCall();
                          formKey.currentState!.validate();

                          _boyNameController.clear();
                          _boyDobController.clear();
                          _boyTobController.clear();
                          _boyPobController.clear();

                          _girlNameController.clear();
                          _girlDobController.clear();
                          _girlTobController.clear();
                          _girlPobController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 10, 123, 216),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text(
                          'Match Horoscope',
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
          _boyDob =
              "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
        } else {
          _girlDobController.text = formatDate.toString();
          _girlDob =
              "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isBoy) async {
    String formatTime;
    TimeOfDay? selectedTime = TimeOfDay.now();
    TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (newTime != null && newTime != selectedTime) {
      setState(() {
        selectedTime = newTime;
        formatTime =
            "${(selectedTime!.hour > 12 ? selectedTime!.hour - 12 : selectedTime!.hour).abs()}:${selectedTime!.minute} ${selectedTime!.hour >= 12 ? "PM" : "AM"}";
        if (isBoy) {
          _boyTobController.text = formatTime.toString();
          _boyTob = "${selectedTime!.hour}:${selectedTime!.minute}:00";
        } else {
          _girlTobController.text = formatTime.toString();
          _girlTob = "${selectedTime!.hour}:${selectedTime!.minute}:00";
        }
      });
    }
  }

  Future<void> fetchPlaces(BuildContext context, bool isBoy) async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: Mode.overlay,
      language: "en",
      types: [],
      strictbounds: false,
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [Component(Component.country, "in")],
    );

    // log("Pvalue..$p");
    // ignore: use_build_context_synchronously
    displayPrediction(p!, context, isBoy);
  }

  void onError(PlacesAutocompleteResponse response) {
    // log("mSG.... ${response.errorMessage}");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(
      Prediction? p, BuildContext context, bool isBoy) async {
    if (p != null) {
      // get detail (lat/lng)
      GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        //apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
          await places.getDetailsByPlaceId(p.placeId!);
      final place = p.description.toString();
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      setState(() {
        if (isBoy) {
          _boyPobController.text = place;
          boyLati = lat.toString();
          boyLong = lng.toString();
        } else {
          _girlPobController.text = place;
          girlLati = lat.toString();
          girlLong = lng.toString();
        }
        // log("message$lat$lng");
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something went wrong"),
      ));
    }
  }
}