import 'package:astrology_app/chat/conversation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:geolocator/geolocator.dart';
//import 'newmatch.dart';

//---------------------------------------------------------Open Matching Page of Kundli--------------------------------------

class OpenKundliTab1 extends StatefulWidget {
  const OpenKundliTab1({super.key});

  @override
  State<OpenKundliTab1> createState() => _OpenKundliTab1State();
}

class _OpenKundliTab1State extends State<OpenKundliTab1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Text(
                'Search Kundli by Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic_none,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Recently Opened',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // OpenContainer(
        //   icon: Icons.delete_outline_outlined,
        // ),
        Expanded(
          child: ListView.builder(
              itemCount: kundlist.length,
              itemBuilder: (context, index) => OpenKund(
                    containertext: kundlist[index].containertext,
                    date: kundlist[index].date,
                    location: kundlist[index].location,
                    name: kundlist[index].name,
                    time: kundlist[index].time,
                  )),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class OpenKundliList {
  late String containertext;
  late String name;
  late String date;
  late String location;
  late String time;

  OpenKundliList(
      {required this.containertext,
      required this.name,
      required this.date,
      required this.location,
      required this.time});
}

List<OpenKundliList> kundlist = [
  OpenKundliList(
      containertext: 'D',
      name: 'Dev',
      date: '23 January 1994',
      location: 'Sambalpur, Odisha, India',
      time: '08:16 AM'),
  OpenKundliList(
      containertext: 'K',
      name: 'Kuvlin kaur',
      date: '23 January 1998',
      location: 'Burla, Odisha, India',
      time: '09:21 PM')
];

//---------
class OpenKund extends StatelessWidget {
  const OpenKund({
    super.key,
    required this.containertext,
    required this.name,
    required this.date,
    required this.location,
    required this.time,
  });
  final String containertext, name, date, time, location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      containertext,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      date + ', ' + time,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      location,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

//-------------------------------------Kundli matching -open matching- list container design of Kundli----------------------------------------------------------------

class OpenContainer extends StatefulWidget {
  const OpenContainer({super.key, required this.icon});
  final IconData icon;

  @override
  State<OpenContainer> createState() => _OpenContainerState();
}

class _OpenContainerState extends State<OpenContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'D',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dev',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '23 January 1994, 08:16 AM',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Jajpur Road, Odisha, India',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Icon(
                  widget.icon,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'K',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kuvlin kaur',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '23 January 1998, 09:21 PM',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Burla, Odisha, India',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Icon(
                  widget.icon,
                  color: Colors.red,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

//----------------------------------------------------------- Calender of New Matching Tab2 --------------------------------------------------------------------------
class CalenderNM extends StatefulWidget {
  const CalenderNM({super.key});

  @override
  State<CalenderNM> createState() => _CalenderNMState();
}

class _CalenderNMState extends State<CalenderNM> {
  TextEditingController _birthdate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: () async {
            // final DateTime date = DateTime(2023, 6, 3);
            // final DateFormat dateFormat = DateFormat('dd MMMM yyyy');
            // final String formattedDate = dateFormat.format(date);

            String formatDate;
            DateTime? selectedDate = DateTime.now();
            DateTime? pickedate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(1800),
              lastDate: DateTime(3000),
            );

            if (pickedate != null && pickedate != selectedDate) {
              setState(() {
                selectedDate = pickedate;
                formatDate =
                    "${selectedDate!.day} / ${selectedDate!.month} / ${selectedDate!.year}";
                _birthdate.text = formatDate.toString();
              });
            }
          },
          child: TextField(
            controller: _birthdate,
            enabled: false,
            style: const TextStyle(color: Colors.white, fontSize: 17),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_month_outlined),
              hintText: 'Enter Date Of Birth',
              hintStyle: TextStyle(color: Colors.white),
              prefixIconColor: Colors.white,
              filled: true,
              fillColor: Colors.black.withOpacity(0.2),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------Time Picker of New Matching Tab2 -------------------------------------------------------------------------------
class TimePickerNM extends StatefulWidget {
  const TimePickerNM({super.key});

  @override
  State<TimePickerNM> createState() => _TimePickerNMState();
}

class _TimePickerNMState extends State<TimePickerNM> {
  TextEditingController _birthtime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //use this if needed....
    //final hours = _birthtime.toString().padLeft(2, '0');
    //final minutes = _birthtime.toString().padLeft(2, '0');
    return SafeArea(
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: () async {
            String formatTime;
            TimeOfDay? selectedTime = TimeOfDay.now();
            TimeOfDay? newTime = await showTimePicker(
                context: context, initialTime: selectedTime);

            if (newTime != null && newTime != selectedTime) {
              setState(() {
                selectedTime = newTime;
                formatTime = "${selectedTime!.hour} : ${selectedTime!.minute}";
                _birthtime.text = formatTime.toString();
              });
            }
          },
          child: TextFormField(
            controller: _birthtime,
            enabled: false,
            style: const TextStyle(color: Colors.white, fontSize: 17),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.access_time_rounded),
              hintText: 'Enter Time Of Birth',
              hintStyle: TextStyle(color: Colors.white),
              prefixIconColor: Colors.white,
              filled: true,
              fillColor: Colors.black.withOpacity(0.2),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(17))),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          ),
        ),
      ),
    );
  }
}

//----------------------report class card----------------
class ReportCardComponent extends StatefulWidget {
  const ReportCardComponent(
      {super.key,
      required this.heading,
      required this.description,
      required this.color,
      required this.cpcolor,
      required this.cptext});

  final String heading;
  final String description;
  final Color color;
  final Color cpcolor;
  final String cptext;

  @override
  State<ReportCardComponent> createState() => _ReportCardComponentState();
}

class _ReportCardComponentState extends State<ReportCardComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.color,
              border: Border.all(color: Color.fromARGB(255, 9, 108, 237))),
          child: Row(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      widget.heading,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircularPercentIndicator(
                      radius: 40,
                      lineWidth: 7,
                      percent: 0.65,
                      progressColor: widget.cpcolor,
                      backgroundColor: const Color.fromARGB(255, 175, 127, 127)
                          .withOpacity(0.3),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        widget.cptext,
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class PartnerPicture extends StatefulWidget {
  const PartnerPicture({super.key, required this.image, required this.manglik});
  final String image;
  final String manglik;

  @override
  State<PartnerPicture> createState() => _PartnerPictureState();
}

class _PartnerPictureState extends State<PartnerPicture> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white), shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              widget.image,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          widget.manglik,
          style: TextStyle(color: Colors.green, fontSize: 19),
        ),
        ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.redAccent; //<-- SEE HERE
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {},
            child: Text(
              'View Kundli',
            )),
      ],
    );
  }
}

//---------------Report Astrologer-------------------------
class ConclusionAstro extends StatefulWidget {
  const ConclusionAstro({super.key});

  @override
  State<ConclusionAstro> createState() => _ConclusionAstroState();
}

class _ConclusionAstroState extends State<ConclusionAstro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 240, 159, 159),
              Color.fromARGB(255, 202, 134, 223),
            ],
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: Color.fromARGB(255, 34, 216, 207), width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Astrologer Conclusion',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'In Hindu Religious Texts, marriage has been defined as a sacred union of two people. Since ages marriage has been considered as an auspicious omen and done with grand celebrations.Two people live their life together after marriage. Therefore marriage is a commitment which requires a lot of conviction. Every parent wants their children to get happily married and stay together happily. For this reason, people always look for the reliable sources where they can get accurate advice helpful in marriage related decisions. Astrologer Ashok Prajapati is the well-known name offering reliable astrology services since years. His vast experience in the field and in-depth knowledge of astrology has helped numbers of people to get easy solutions for the problems of life. Kundali matching service is also offered by astrologer Ashok Prajapati that helps people to get astrological science based remedies for their problems.',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color.fromARGB(255, 230, 157, 236)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConversationScreen()));
                },
                child: Text(
                  'Chat With astrologer',
                  style: TextStyle(
                      color: Color.fromARGB(151, 0, 0, 0), fontSize: 20),
                )),
            Image.asset('assets/images/kmatch.jpg'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color.fromARGB(255, 212, 96, 96)),
                onPressed: () {},
                child: Text(
                  'Share My match',
                  style: TextStyle(
                      color: Color.fromARGB(149, 34, 33, 33), fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}


//-------------------------------Demo geolocator---------------------------------------------
// class GeolocatorMap extends StatefulWidget {
//   const GeolocatorMap({super.key});

//   @override
//   State<GeolocatorMap> createState() => _GeolocatorMapState();
// }

// class _GeolocatorMapState extends State<GeolocatorMap> {
//   final TextEditingController locationController = TextEditingController();
//   final Geolocator geolocator = Geolocator();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.98,
//       width: MediaQuery.of(context).size.width * 0.97,
//       child: ,
//     );
//   }
// }

// void getCurrentLocation() async {
//   try {
//     Position position = await geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     List<Placemark> placemarks = await geolocator.placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     Placemark placemark = placemarks.first;

//     String currentLocation =
//         '${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
//     locationController.text = currentLocation;
//   } catch (e) {
//     print(e);
//   }
// }
