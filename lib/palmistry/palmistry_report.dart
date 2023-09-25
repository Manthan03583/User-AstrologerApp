import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PalmistryReport extends StatefulWidget {
  const PalmistryReport({super.key});

  @override
  State<PalmistryReport> createState() => _PalmistryReportState();
}

class _PalmistryReportState extends State<PalmistryReport> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const HadLineP(
                    text: 'Palmistry Report'
                  ),
                  IconButton(
                    onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const Consultation()));
                      Share.share('com.example.astrology_app');
                    }, 
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Heart Line',
                        style: TextStyle(color: Colors.white,fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Id alias ab rerum voluptas et nihil provident \nrecusandae. Id quis quo neque qui et. \nReprehenderit asperiores dignissimos aut \nrepellat totam dolorum sit qui. Eligendi tenetur \nsaepe optio vitae. Dolorem expedita molestias \niste ex corrupti nostrum. Iste molestiae sint \ncorrupti aut et in beatae atque quo.',
                        style: TextStyle(color: Colors.white,fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Health line',
                        style: TextStyle(color: Colors.white,fontSize: 14),
                      ),                     
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Id alias ab rerum voluptas et nihil provident \nrecusandae. Id quis quo neque qui et. \nReprehenderit asperiores dignissimos aut \nrepellat totam dolorum sit qui. Eligendi tenetur \nsaepe optio vitae. Dolorem expedita molestias \niste ex corrupti nostrum. Iste molestiae sint \ncorrupti aut et in beatae atque quo.',
                        style: TextStyle(color: Colors.white,fontSize: 14),
                      ),                     
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Head line',
                        style: TextStyle(color: Colors.white,fontSize: 14),
                      ),                      
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Id alias ab rerum voluptas et nihil provident \nrecusandae. Id quis quo neque qui et. \nReprehenderit asperiores dignissimos aut \nrepellat totam dolorum sit qui. Eligendi tenetur \nsaepe optio vitae. Dolorem expedita molestias \niste ex corrupti nostrum. Iste molestiae sint \ncorrupti aut et in beatae atque quo.',
                        style: TextStyle(color: Colors.white,fontSize: 14),
                      ),                     
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