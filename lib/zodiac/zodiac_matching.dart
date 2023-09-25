import 'package:flutter/material.dart';

class ZodiacMatching extends StatefulWidget {
  const ZodiacMatching({super.key});

  @override
  State<ZodiacMatching> createState() => _ZodiacMatchingState();
}

class _ZodiacMatchingState extends State<ZodiacMatching> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 43,
          width: MediaQuery.of(context).size.width * 0.95,
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
              const Text(
                'Search kundli by name ',
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
        const SizedBox(
          height: 13,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Recently Opened',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
        const SizedBox(
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
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      containertext,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '$date, $time',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      location,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                const Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}