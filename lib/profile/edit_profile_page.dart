import 'dart:io';

import 'package:astrology_app/constants/keys.dart';
import 'package:astrology_app/onboarding/dateformatter.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:astrology_app/profile/user_profile_page.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

  String Gender = '';
  final TextEditingController _birthdate = TextEditingController();
  final TextEditingController _birthtime = TextEditingController();
  final TextEditingController _place = TextEditingController();
  final TextEditingController _name = TextEditingController();

  static const kGoogleApiKey = Constants.googleApiKey;
  GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  dynamic imageFile = const AssetImage('assets/images/profile_placeholder.png');

  Future _cropImage(File? image) async {
    if (image != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop',
              cropGridColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(title: 'Crop')
        ],
      );

      if (cropped != null) {
        setState(() {
          imageFile = FileImage(File(cropped.path));
          print(cropped.path);
        });
      }
    }
  }

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _cropImage(imageTemp);
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to pick image: $e',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _cropImage(imageTemp);
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to pick image: $e',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 25,
            ),
            // alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(children: [
                const HadLineP(
                  text: 'Edit profile',
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.17,
                              width: 150,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: imageFile),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.circular(150),
                              ),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      backgroundColor: Colors.black,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.1),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Profile photo',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await pickImageFromGallery();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                          image:
                                                              const DecorationImage(
                                                            image: AssetImage(
                                                              'assets/images/picture-removebg-preview.png',
                                                            ),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 30,
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.13,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.13,
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      image:
                                                          const DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/google-photos-removebg-preview.png',
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 30,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await pickImageFromCamera();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.13,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.13,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                        image:
                                                            const DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/camera-lens.png',
                                                          ),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    child: const Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                          validator: (value) {
                            if (value != null) {
                              final isname = RegExp(
                                      r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                                  .hasMatch(value);
                              if (!isname) {
                                return "Please enter a valid name";
                              } else {
                                return null;
                              }
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Birth Details',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: InkWell(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: TextFormField(
                                    controller: _birthdate,
                                    enabled: false,
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value == null || value == '') {
                                        return 'Please select a valid date';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Colors.black.withOpacity(0.2),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.white,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 0.5,
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 0.5),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red,
                                              width: 0.5,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Time',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.33,
                                child: InkWell(
                                  onTap: () {
                                    _selectTime(context);
                                  },
                                  child: TextFormField(
                                    controller: _birthtime,
                                    enabled: false,
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value == null || value == '') {
                                        return 'Please select a valid time';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Colors.black.withOpacity(0.2),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.white,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 0.5,
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0.5,
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red,
                                              width: 0.5,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Place',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          onTap: () {
                            fetchPlaces(context);
                          },
                          controller: _place,
                          keyboardType: TextInputType.none,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Please Enter a valid place';
                            }
                          },
                          decoration: const InputDecoration(
                            isDense: true,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Gender',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomRadioButton(
                            // defaultSelected: "Female",
                            elevation: 0,
                            absoluteZeroSpacing: false,
                            spacing: 5,
                            unSelectedColor: Colors.grey.withOpacity(0.3),
                            selectedBorderColor: Colors.blue,
                            unSelectedBorderColor: Colors.white,
                            height: 55,
                            width: 120,
                            shapeRadius: 10,
                            enableShape: true,
                            radius: 10,
                            buttonLables: const [
                              'Male',
                              'Female',
                            ],
                            buttonValues: const [
                              "Male",
                              "Female",
                            ],
                            buttonTextStyle: const ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            radioButtonValue: (value) {
                              setState(() {
                                Gender = value;
                              });
                            },
                            selectedColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if ((Gender == '') ||
                                  (_birthdate.text == '') ||
                                  (_birthtime.text == '') ||
                                  (_place.text == '')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Please Fill all the field')));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserProfileScreen()));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 10, 123, 216),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text(
                            'Save',
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
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    String formatDate;
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1930, 1),
      lastDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        formatDate =
            " ${selectedDate!.day > 10 ? selectedDate!.day : '0${selectedDate!.day}'} - ${DateFormatter().monthInttoString(selectedDate!.month)} - ${selectedDate!.year} ";
        _birthdate.text = formatDate.toString();
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
        formatTime = "${selectedTime!.hour} : ${selectedTime!.minute}";
        _birthtime.text = formatTime.toString();
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
