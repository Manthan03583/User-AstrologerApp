import 'package:astrology_app/palmistry/palmistry.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';

class PalmistryPage extends StatefulWidget {
  const PalmistryPage({super.key});

  @override
  State<PalmistryPage> createState() => _PalmistryPageState();
}

class _PalmistryPageState extends State<PalmistryPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children:  [
              const HadLineP(
                text: 'Palmistry',
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children:  [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Discover your life's destiny by getting a palm reading.",
                        style: TextStyle(color: Colors.white,fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Image.asset('assets/images/hand.png'),
                    const SizedBox(height: 15),
                    const PalmistryP(text: 'Find a well-lit area with minimal shadows \nto ensure accurate scanning.'),
                    const SizedBox(height: 15),                    
                    const PalmistryP(text: 'Keep your hand steady and avoid any \nmovement until the scan is complete.'),
                    const SizedBox(height: 15),
                    const PalmistryP(text: 'Place your right hand in the center of the \nscreen.'),
                  ],
                ),
              ),

              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width*0.90,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Palmistry()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Colors.blue, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ), 
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.qr_code_scanner_sharp),
                      SizedBox(width: 15),
                      Text(
                        'Scan your palm',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}