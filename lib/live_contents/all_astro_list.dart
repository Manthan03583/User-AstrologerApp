import 'dart:ui';

import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

class AllAstrologerList extends StatefulWidget {
  const AllAstrologerList({super.key});

  @override
  State<AllAstrologerList> createState() => _AllAstrologerListState();
}

class _AllAstrologerListState extends State<AllAstrologerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: astroList.length,
                itemBuilder: (context, index) => AstroListContent(
                      image: astroList[index].image,
                      title: astroList[index].title,
                    )),
          ),
        ],
      ),
    );
  }
}

class AstroList {
  late final String image, title;

  AstroList({
    required this.image,
    required this.title,
  });
}

List<AstroList> astroList = [
  AstroList(
      image: "assets/images/astrologers/astro5.jpg",
      title: "Sun-Mercury manthan "),
  AstroList(image: "assets/images/astrologers/astro1.jpg", title: "Rahu Con"),
  AstroList(
      image: "assets/images/astrologers/astro6.jpg", title: "Sun-Mercury"),
  AstroList(image: "assets/images/astrologers/astro4.jpg", title: "Sun"),
];

class AstroListContent extends StatelessWidget {
  const AstroListContent({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
          padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
          child: SizedBox(
            
            width: width * 0.6,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Container(
                  padding: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        //color: Colors.amber,
                        width: width * 0.24,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                //color: Colors.amber,
                                border:
                                    Border.all(color: Colors.green, width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  image,
                                  height: width * 0.2,
                                  width: width * 0.2,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.015,
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(width * 0.005,),
                                child: Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: textColor(), fontSize: width * 0.03),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                       SizedBox(
                        width: width * 0.015,
                      ),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Text(
                            "Live Event",
                            style: TextStyle(color: textColor(), fontSize: width * 0.04),
                          ),
                          Text(
                            "09 Mar, Thursday",
                            style: TextStyle(color: textColor(), fontSize: width * 0.035),
                          ),
                          Text(
                            "11:55 AM",
                            style: TextStyle(color: textColor(), fontSize: width * 0.03),
                          ),
                           SizedBox(
                            height: height * 0.048,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.025),
                            child: Container(
                              padding: EdgeInsets.all(width * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.amber)),
                              child: const Text(
                                "Join Waitlist",
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
