import 'package:flutter/material.dart';
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
