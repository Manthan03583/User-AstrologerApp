import 'package:astrology_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import '../../utils/properties.dart';
import 'chat_tab_view.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //debugPrint(width!.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        //height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, height * 0.05, 0, height * 0.001),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: width * 0.08,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.016,
                  ),
                  Text(
                    "Connect",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w500, color: textColor()),
                  ),
                  SizedBox(
                    width: width * 0.25,
                  ),
                  const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white)),
                    child: Text(
                      "₹ 500",
                      style: TextStyle(color: textColor()),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  const Icon(
                    Icons.filter_alt_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 15,
              // ),

              //...........****TabView******............//

              SizedBox(
                height: width * 0.025,
              ),
              const Flexible(child: SubTabView()),
            ],
          ),
        ),
      ),
    );
  }
}
