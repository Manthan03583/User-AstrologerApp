import 'package:astrology_app/constants/keys.dart';
import 'package:astrology_app/controllers/controllers.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  static const kGoogleApiKey = Constants.googleApiKey;
  GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  final formKey = GlobalKey<FormState>();
  String birthDate = "";
  String birthTime = "";

  final TextEditingController _birthdate = TextEditingController();
  final TextEditingController _birthtime = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _place = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _personalClicked = true;
  bool _consultationClicked = true;
  bool _dataLoad = false;

  Future<void> sendData() async {
    final response = await Controller.sendConsultation(_name.text, birthDate,
        birthTime, _place.text, _descriptionController.text);
        if(response.isNotEmpty){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      response.toString(),
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    )));
        }
  }

  @override
  void dispose() {
    _birthdate.clear();
    _birthtime.clear();
    _name.clear();
    _place.clear();
    _descriptionController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: (_dataLoad == false)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    const HadLineP(text: 'Consultation'),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Fill out the basic details, our experts will \ncontact you.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PanchangButton(
                      btText: 'Personal Details',
                      press: () {
                        setState(() {
                          _personalClicked = !_personalClicked;
                        });
                      },
                      isClicked: _personalClicked,
                    ),
                    const SizedBox(height: 5),
                    _personalClicked
                        ? Form(
                            key: formKey,
                            child: Column(
                              children: [
                                PersonalDetails(
                                  text: 'Name',
                                  icon: Icons.person_outline_outlined,
                                  text1: 'Enter Name',
                                  passController: _name,
                                  validation: (String? value) {
                                    if (value == null || value == '') {
                                      return "Enter a valid Name";
                                    } else {
                                      final isValid = RegExp(
                                              r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                                          .hasMatch(value);
                                      if (!isValid) {
                                        return 'Enter a valid Name';
                                      } else {
                                        return null;
                                      }
                                    }
                                  },
                                ),
                                // SizedBox(height: 5),
                                PersonalDetails(
                                  text: 'Birth date',
                                  icon: Icons.calendar_month_outlined,
                                  text1: 'Enter Birthdate',
                                  passController: _birthdate,
                                  press: () {
                                    setState(() {
                                      _selectDate(context);
                                    });
                                  },
                                  validation: (String? value) {
                                    if (value == null || value == '') {
                                      return "Enter a valid Birth Date";
                                    }
                                    return null;
                                  },
                                ),
                                // SizedBox(height: 5),
                                PersonalDetails(
                                  text: 'Birth time',
                                  icon: Icons.access_time_rounded,
                                  text1: 'Enter Birthtime',
                                  passController: _birthtime,
                                  press: () {
                                    setState(() {
                                      _selectTime(context);
                                    });
                                  },
                                  validation: (String? value) {
                                    if (value == null || value == '') {
                                      return "Enter a valid Birth Time";
                                    }
                                    return null;
                                  },
                                ),
                                // SizedBox(height: 5),
                                PersonalDetails(
                                  text: 'Birth place',
                                  icon: Icons.location_on_outlined,
                                  text1: 'Enter Birthplace',
                                  passController: _place,
                                  press: () {
                                    setState(() {
                                      fetchPlaces(context);
                                    });
                                  },
                                  validation: (String? value) {
                                    if (value == null || value == '') {
                                      return "Enter a valid Birth Place";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(
                            height: 15,
                          ),
                    const SizedBox(height: 15),
                    PanchangButton(
                      btText: 'Consultation Details',
                      press: () {
                        setState(() {
                          _consultationClicked = !_consultationClicked;
                        });
                      },
                      isClicked: _consultationClicked,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: _consultationClicked
                          ? Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Reason for consultation',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.40,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.white),
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: TextField(
                                      controller: _descriptionController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      textInputAction: TextInputAction.newline,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        hintMaxLines: 8,
                                        border: InputBorder.none,
                                        hintText:
                                            'Briefly describe the reason for consultation in 255 words',
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 122, 119, 119),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const Spacer(),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: ElevatedButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          sendData().whenComplete(() {
                            _dataLoad = true;
                            _birthdate.clear();
                            _birthtime.clear();
                            _name.clear();
                            _place.clear();
                            _descriptionController.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 3, 101, 182),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: const Text(
                          "Request Consultation",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
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
            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
        _birthdate.text = formatDate.toString();
        birthDate =
            "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    String formatTime;
    TimeOfDay? selectedTime = TimeOfDay.now();
    TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (newTime != null && newTime != selectedTime) {
      setState(() {
        selectedTime = newTime;
        var hour = (selectedTime!.hour > 12)
            ? selectedTime!.hour - 12
            : selectedTime!.hour;
        formatTime =
            "${(hour < 10 ? "0$hour" : hour)}:${selectedTime!.minute < 10 ? "0${selectedTime!.minute}" : selectedTime!.minute} ${selectedTime!.hour >= 12 ? "PM" : "AM"}";
        _birthtime.text = formatTime.toString();
        birthTime =
            "${(hour < 10 ? "0$hour" : hour)}:${selectedTime!.minute < 10 ? "0${selectedTime!.minute}" : selectedTime!.minute}";
      });
    }
  }

  Future<void> fetchPlaces(BuildContext context) async {
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
    displayPrediction(p!, context);
  }

  void onError(PlacesAutocompleteResponse response) {
    // log("mSG.... ${response.errorMessage}");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(Prediction? p, BuildContext context) async {
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
        _place.text = place;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something went wrong"),
      ));
    }
  }
}
