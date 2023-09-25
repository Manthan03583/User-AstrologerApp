import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';

// *****  USER PROFILE *****//

class Profile extends StatefulWidget {
  const Profile({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            widget.icon,
            color: Colors.white.withOpacity(0.3),
            size: 20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            widget.text,
            style:
                TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 16),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//******* USER SETTING ******//

class SPage extends StatefulWidget {
  const SPage({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  State<SPage> createState() => _SPageState();
}

class _SPageState extends State<SPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          widget.icon,
          color: Colors.white,
          size: 25,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          widget.text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}

// ***** USER HADE LINE SCREEN  *****//

class HadLineP extends StatefulWidget {
  const HadLineP({super.key, required this.text});

  final String text;

  @override
  State<HadLineP> createState() => _HadLinePState();
}

class _HadLinePState extends State<HadLineP> {
  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
            size: width * 0.04,
          ),
        ),

        // const SizedBox(
        //   width: 5,
        // ),

        Text(
          widget.text,
          style:TextStyle(
            fontSize: width * 0.045,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

// ********    USER ALL BUTTON SCREEN   *******//

class UserAllButtonPage extends StatelessWidget {
  const UserAllButtonPage(
      {Key? key, required this.btnText, required this.pressed})
      : super(key: key);

  final String btnText;
  final void Function() pressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 130,
      child: ElevatedButton(
        onPressed: pressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Text(
          btnText,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//*******  USER SETTING  *******//

class RadioB extends StatefulWidget {
  final ValueChanged<String> onSelectLanguage;
  final String initialValue;
  const RadioB({
    super.key, required this.onSelectLanguage, required this.initialValue,
  });

  @override
  State<RadioB> createState() => _RadioBState();
}

class _RadioBState extends State<RadioB> {
  final _listVertical = ["Hindi", "English","Odia", "Bengali"];
  // var _indexVartical = ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.88,
          // margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FlutterRadioGroup(
              titles: _listVertical,
              titleStyle: const TextStyle(color: Colors.white, fontSize: 17),
              activeColor: Colors.white,
              orientation: RGOrientation.VERTICAL,
              defaultSelected: _listVertical.indexOf(widget.initialValue),
              onChanged: (index) {
                setState(() {
                  widget.onSelectLanguage(_listVertical[index!].toString());
                });
              },
            ),
          ]),
        ),
      ],
    );
  }
}

///*********   -----------------------------     ********///

class RButton extends StatefulWidget {
  const RButton({
    super.key,
    required this.image,
    required this.text,
  });
  final ImageProvider<Object> image;
  final String text;
  @override
  State<RButton> createState() => _RButtonState();
}

class _RButtonState extends State<RButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(1)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        RadioMenuButton(
            value: 1,
            groupValue: 4,
            onChanged: (index) {
              setState(() {});
            },
            child: Row(
              children: [
                Image.asset(
                  widget.image as String,
                  height: 45,
                  width: 45,
                ),
                Text(
                  widget.text,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ))
      ]),
    );
  }
}

//*****  ADD WALLET  *****//

class SelectB extends StatefulWidget {
  const SelectB({super.key});

  @override
  State<SelectB> createState() => _SelectBState();
}

class _SelectBState extends State<SelectB> {
  @override
  Widget build(BuildContext context) {
    return CustomRadioButton(
      elevation: 0,
      absoluteZeroSpacing: false,
      spacing: 5,
      unSelectedColor: Colors.white.withOpacity(0.1),
      selectedBorderColor: Colors.white,
      unSelectedBorderColor: Colors.white,
      height: 55,
      width: 120,
      shapeRadius: 10,
      enableShape: true,
      radius: 10,
      buttonLables: const [
        'Cancel',
        'Confirm',
      ],
      buttonValues: const [
        "Cancel",
        "Confirm",
      ],
      buttonTextStyle: const ButtonTextStyle(
          selectedColor: Colors.white,
          unSelectedColor: Colors.white,
          textStyle: TextStyle(fontSize: 16)),
      radioButtonValue: (value) {
        print(value);
      },
      selectedColor: Theme.of(context).colorScheme.secondary,
    );
  }
}

///*******************  ----------------------------------- ****************///

class FollowingP extends StatefulWidget {
  const FollowingP({super.key});

  @override
  State<FollowingP> createState() => _FollowingPState();
}

class _FollowingPState extends State<FollowingP> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 63,
          width: 63,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/boy-dp.jpg')),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(50)),

          // child: Image.asset(
          //   'assets/images/boy-dp.jpg',
          //   height: 20,
          //   width: 20,
          // ),
        ),
      ],
    );
  }
}

//*****  USER KUNDLI  *****//

class KPage extends StatefulWidget {
  const KPage({super.key, required this.text});
  final String text;

  @override
  State<KPage> createState() => _KPageState();
}

class _KPageState extends State<KPage> {
  @override
  Widget build(BuildContext context) {
         var width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}

//******  USER KUNDLI ******//

class CKPage extends StatelessWidget {
  const CKPage({super.key, required this.text, required this.text1});
  final String text;
  final String text1;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.28,
      width: width * 0.95,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding:
            EdgeInsets.only(left: width * 0.035, top: width * 0.035, right: width * 0.035, bottom: width * 0.035),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: width * 0.035),
            ),
            SizedBox(
              height: width * 0.032,
            ),
            Text(
              text1,
              //strutStyle: StrutStyle.fromTextStyle(),
              softWrap: true,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.033,
              ),
            )
          ],
        ),
      ),
    );
  }
}

//******  USER KUNDLI ******//

class DPage extends StatelessWidget {
  const DPage(
      {super.key,
      required this.text,
      required this.text1,
      required this.text2});
  final String text;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.59,
      width: width * 0.95,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding:
             EdgeInsets.only(left: width * 0.035, top: width * 0.035, right: width * 0.035, bottom: width * 0.035),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: width * 0.035),
                ),
              ],
            ),
            SizedBox(
              height: width * 0.1,
            ),
            Column(
              children: [
                Text(
                  text1,
                  //textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white, fontSize: width * 0.034),
                ),
                SizedBox(
                  height: width * 0.08,
                ),
                Text(
                  text2,
                  overflow: TextOverflow.ellipsis,
                  //textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.034,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//****** USER KUNDLI******//

class DashaPage extends StatelessWidget {
  const DashaPage(
      {super.key,
      required this.text,
      required this.text1,
      required this.text2});
  final String text;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.7,
      width: width * 0.95,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding:
            EdgeInsets.only(left: width * 0.035, top: width * 0.035, right: width * 0.035, bottom: width * 0.035),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: width * 0.035),
                ),
              ],
            ),
            SizedBox(
              height: width * 0.1,
            ),
            Column(
              children: [
                Text(
                  text1,
                  
                  style: TextStyle(color: Colors.white, fontSize: width * 0.034),
                ),
                SizedBox(
                  height: width * 0.08,
                ),
                Text(
                  text2,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.034,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//******  USER KUNDLI ******//

// class CTKundli extends StatelessWidget {
//   const CTKundli({super.key, required this.text});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                           height: 29,
//                           width: MediaQuery.of(context).size.width*0.21,
//                           decoration: BoxDecoration(
//                             color:  const Color.fromARGB(255, 241, 233, 161),
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                           child:  Padding(
//                             padding: const EdgeInsets.only(top: 5,left: 17,right: 10),
//                             child: Text(
//                               text,
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 11
//                               ),
//                               // textAlign: Alignment.center,
//                             ),
//                           ),
//                         ),
//                   ],
//                 );
//   }
// }

//****** USER KUNDLI *****//

class PlanetaryPage extends StatelessWidget {
  const PlanetaryPage({super.key, required this.text, required this.text1});
  final String text;
  final String text1;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.47,
      width: width * 0.95,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding:
            EdgeInsets.only(left: width * 0.037, top: width * 0.037, right: width * 0.037, bottom: width * 0.037),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: width * 0.037),
                ),
              ],
            ),
            SizedBox(
              height: width * 0.045,
            ),
            Text(
              text1,
              style: TextStyle(color: Colors.white, fontSize: width * 0.035),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogP extends StatefulWidget {
  const BlogP({super.key, required this.text});
  final String text;

  @override
  State<BlogP> createState() => _BlogPState();
}

class _BlogPState extends State<BlogP> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}

//****************** USER Panchang  *********************//

class Panchang extends StatefulWidget {
  const Panchang(
      {super.key,
      required this.text,
      required this.text1,
      required this.text2,
      required this.text3});
  final String text;
  final String text1;
  final String text2;
  final String text3;

  @override
  State<Panchang> createState() => _PanchangState();
}

class _PanchangState extends State<Panchang> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            widget.text1,
            style:
                TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 17),
          ),
          const SizedBox(height: 5),
          Text(
            widget.text2,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 5),
          Text(
            widget.text3,
            style:
                TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 14),
          ),
        ]),
      ),
    );
  }
}

class PanchangButton extends StatelessWidget {
  const PanchangButton({
    super.key,
    required this.btText,
    required this.press,
    required this.isClicked,
  });
  final String btText;
  final void Function() press;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
          color: const Color.fromARGB(98, 2, 82, 222),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              btText,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: press,
              icon: Icon(
                isClicked
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PanchangP extends StatefulWidget {
  const PanchangP({super.key, required this.text, required this.text1});
  final String text;
  final String text1;

  @override
  State<PanchangP> createState() => _PanchangPState();
}

class _PanchangPState extends State<PanchangP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              widget.text1,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class PanchangAuspi extends StatefulWidget {
  const PanchangAuspi({super.key, required this.text, required this.text1});
  final String text;
  final String text1;
  // final String text2;

  @override
  State<PanchangAuspi> createState() => _PanchangAuspiState();
}

class _PanchangAuspiState extends State<PanchangAuspi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.text1,
              // textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.3), fontSize: 14.0),
            ),
            // const SizedBox(height: 5),
            // Text(
            //   widget.text1,
            //   style: TextStyle(color: Colors.white.withOpacity(0.3),fontSize: 15),
            // ),
          ],
        ),
      ),
    );
  }
}

class PersonalDetails extends StatelessWidget {
  const PersonalDetails(
      {super.key,
      required this.text,
      required this.icon,
      required this.text1,
      required this.passController,
      this.press,
      this.validation});
  final String text;
  final String text1;
  final IconData icon;
  final TextEditingController passController;
  final String? Function(String? value)? validation;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: passController,
            validator: validation,
            // enabled: false,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(
                icon,
                color: Color.fromARGB(255, 129, 127, 127),
              ),
              hintText: text1,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 129, 129, 129)),
              focusColor: Colors.white,
              filled: true,
              // fillColor: Colors.black.withOpacity(0.2),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onTap: press,
          ),
        ],
      ),
    );
  }
}
class PalmistryP extends StatefulWidget {
  const PalmistryP({super.key, required this.text});
  final String text;

  @override
  State<PalmistryP> createState() => _PalmistryPState();
}

class _PalmistryPState extends State<PalmistryP> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 22,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class KundliMachingPage extends StatelessWidget {
  const KundliMachingPage(
      {super.key,
      required this.text,
      required this.icon,
      required this.text1,
      required this.passController,
      required this.press, required this.validation});
  final String text;
  final String text1;
  final IconData icon;
  final String? Function(String? value) validation;
  final TextEditingController passController;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: passController,
            validator: validation,
            // enabled: false,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: const Color.fromARGB(255, 129, 127, 127),
              ),
              hintText: text1,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 129, 129, 129)),
              focusColor: Colors.white,
              filled: true,
              // fillColor: Colors.black.withOpacity(0.2),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onTap: press,
          ),
        ],
      ),
    );
  }
}
