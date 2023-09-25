//import 'package:astrology_app/connect_contents/chat_tab_view.dart';
import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class AstrologerList extends StatefulWidget {
  //final int index;
  const AstrologerList({super.key});

  @override
  State<AstrologerList> createState() => _AstrologerListState();
}

class _AstrologerListState extends State<AstrologerList> {
  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.025),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: astrologer.length,
            itemBuilder: ((context, index) => AstrologerDetailContent(
                  image: astrologer[index].image,
                  title: astrologer[index].title,
                  orders: astrologer[index].orders,
                  fees: astrologer[index].fees,
                  cat: astrologer[index].cat,
                  language: astrologer[index].language,
                  exp: astrologer[index].exp,
                ))),
      ),
    );
  }
}

class AstrologerDetailsList {
  late final String image, title, orders, fees, cat, language, exp;

  AstrologerDetailsList({
    required this.image,
    required this.title,
    required this.orders,
    required this.fees,
    required this.cat,
    required this.language,
    required this.exp,
  });
}

final List<AstrologerDetailsList> astrologer = [
  AstrologerDetailsList(
    image: "assets/images/astrologers/astro6.jpg",
    title: "Astrologer",
    orders: '458',
    fees: 'Rs 15/min',
    cat: 'Numerology, vastu',
    language: 'Hindi, English',
    exp: '7 years',
  ),
  AstrologerDetailsList(
    image: "assets/images/astrologers/astro5.jpg",
    title: "Astrologer",
    orders: '458',
    fees: 'Rs 15/min',
    cat: 'Numerology, vastu',
    language: 'Hindi, English',
    exp: '7 years',
  ),
  AstrologerDetailsList(
    image: "assets/images/astrologers/astro4.jpg",
    title: "Astrologer",
    orders: '458',
    fees: 'Rs 15/min',
    cat: 'Numerology, vastu',
    language: 'Hindi, English',
    exp: '7 years',
  ),
  AstrologerDetailsList(
    image: "assets/images/astrologers/astro1.jpg",
    title: "Astrologer",
    orders: '458',
    fees: 'Rs 15/min',
    cat: 'Numerology, vastu',
    language: 'Hindi, English',
    exp: '7 years',
  ),
  AstrologerDetailsList(
    image: "assets/images/astrologers/astro3.jpg",
    title: "Astrologer",
    orders: '458',
    fees: 'Rs 15/min',
    cat: 'Numerology, vastu',
    language: 'Hindi, English',
    exp: '7 years',
  ),
  AstrologerDetailsList(
    image: "assets/images/astrologers/astro2.jpg",
    title: "Astrologer",
    orders: '458',
    fees: 'Rs 15/min',
    cat: 'Numerology, vastu',
    language: 'Hindi, English',
    exp: '7 years',
  ),
  AstrologerDetailsList(
    image: "assets/images/astrologers/astro3.jpg",
    title: "Astrologer",
    orders: '458',
    fees: 'Rs 15/min',
    cat: 'Numerology, vastu',
    language: 'Hindi, English',
    exp: '7 years',
  ),
  AstrologerDetailsList(
    image: "assets/images/astrologers/astro1.jpg",
    title: "Astrologer",
    orders: '458',
    fees: 'Rs 15/min',
    cat: 'Numerology, vastu',
    language: 'Hindi, English',
    exp: '7 years',
  ),
];

class AstrologerDetailContent extends StatelessWidget {
  const AstrologerDetailContent(
      {super.key,
      required this.image,
      required this.title,
      required this.orders,
      required this.fees,
      required this.cat,
      required this.language,
      required this.exp});

  final String image, title, orders, fees, cat, language, exp;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          Container(
            height: height * 0.27,
            width: width,
            margin: EdgeInsets.only(bottom: width * 0.02),
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.025, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: width * 0.05,
                    ),
                    SizedBox(
                      //color: Colors.amber,
                      height: height * 0.12,
                      width: width * 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    SmoothStarRating(
                      rating: 3.0,
                      starCount: 5,
                      size: 12.0,
                      color: const Color.fromARGB(255, 255, 210, 7),
                      borderColor: const Color.fromARGB(255, 255, 210, 7),
                    ),
                    SizedBox(
                      height: width * 0.015,
                    ),
                    Text(
                      orders,
                      style: TextStyle(color: textColor()),
                    )
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.03,
                      top: width * 0.05,
                      bottom: width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: width * 0.05,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  color: textColor(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.01),
                              child: Image.asset(
                                "assets/images/tick.png",
                                height: width * 0.07,
                                width: width * 0.07,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Flexible(
                          child: Text(
                            "Category:  $cat",
                            style: TextStyle(
                                color: textColor(), fontSize: width * 0.035),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.005,
                        ),
                        Text(
                          "Language : $language",
                          style: TextStyle(
                              color: textColor(), fontSize: width * 0.035),
                        ),
                        SizedBox(
                          height: width * 0.005,
                        ),
                        Text(
                          "Exp : $exp",
                          style: TextStyle(
                              color: textColor(), fontSize: width * 0.035),
                        ),
                        SizedBox(
                          height: width * 0.005,
                        ),
                        Text(
                          "Fees : $fees",
                          style: TextStyle(
                              color: textColor(), fontSize: width * 0.035),
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     color: Colors.greenAccent,
                //     child: Padding(
                //       padding:
                //           const EdgeInsets.only(left: 8, top: 12, bottom: 10),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Image.asset(
                //             "assets/images/tick.png",
                //             height: 27,
                //             width: 27,
                //           ),
                //           const SizedBox(
                //             height: 35,
                //           ),
                //           // Container(
                //           //   width: 65,
                //           //   decoration: BoxDecoration(
                //           //       border: Border.all(color: Colors.green),
                //           //       borderRadius: BorderRadius.circular(8)),
                //           //   child: const Padding(
                //           //     padding: EdgeInsets.all(5.0),
                //           //     child: Text(
                //           //       "Chat",
                //           //       style: TextStyle(color: Colors.green),
                //           //       textAlign: TextAlign.center,
                //           //     ),
                //           //   ),
                //           // )
                //         ],
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Positioned(
              bottom: width * 0.05,
              left: width * 0.3,
              right: width * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.015),
                            child: const Text(
                              "Chat",
                              style: TextStyle(color: Colors.green),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        Text(
                          "Wait - 10 min",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 239, 90, 80),
                              fontSize: width * 0.025),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.015),
                            child: const Text(
                              "Call",
                              style: TextStyle(color: Colors.green),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        Text(
                          "Wait - 10 min",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 239, 90, 80),
                              fontSize: width * 0.025),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

// class AstrologerList extends StatefulWidget {
//   const AstrologerList({super.key});

//   @override
//   State<AstrologerList> createState() => _AstrologerListState();
// }

// class _AstrologerListState extends State<AstrologerList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         child: ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             itemCount: astrologer.length,
//             itemBuilder: ((context, index) => AstrologerDetailContent(
//                   image: astrologer[index].image,
//                   title: astrologer[index].title,
//                   // cat: astrologer[index].cat,
//                   // exp: astrologer[index].exp,
//                   // fees: astrologer[index].fees,
//                   // language: astrologer[index].language,
//                   // orders: astrologer[index].orders,
//                 ))),
//       ),
//     );
//   }
// }

// class AstrologerDetailsList {
//   late final String image, orders, title, cat, language, exp, fees;

//   AstrologerDetailsList({
//     required this.image,
//     required this.title,
//     // required this.orders,
//     // required this.cat,
//     // required this.language,
//     // required this.exp,
//     // required this.fees,
//   });
// }

// final List<AstrologerDetailsList> astrologer = [
//   AstrologerDetailsList(
//     image: "assets/images/astrologers/astro1.jpg",
//     title: "Astrologer",

//     // language: 'Hindi, English',
//     // exp: '5 years',
//   ),
//   AstrologerDetailsList(
//     image: "assets/images/astrologers/astro1.jpg",
//     title: "Astrologer",
//     // orders: '458',
//     // fees: 'Rs 15/min',
//     // cat: 'Numerology, vastu',
//     // language: 'Hindi, English',
//     // exp: '5 years',
//   ),
//   AstrologerDetailsList(
//     image: "assets/images/astrologers/astro1.jpg",
//     title: "Astrologer",
//     // orders: '458',
//     // fees: 'Rs 15/min',
//     // cat: 'Numerology, vastu',
//     // language: 'Hindi, English',
//     // exp: '5 years',
//   ),
//   AstrologerDetailsList(
//     image: "assets/images/astrologers/astro1.jpg",
//     title: "Astrologer",
//     // orders: '458',
//     // fees: 'Rs 15/min',
//     // cat: 'Numerology, vastu',
//     // language: 'Hindi, English',
//     // exp: '5 years',
//   ),
//   AstrologerDetailsList(
//     image: "assets/images/astrologers/astro1.jpg",
//     title: "Astrologer",
//     // orders: '458',
//     // fees: 'Rs 15/min',
//     // cat: 'Numerology, vastu',
//     // language: 'Hindi, English',
//     // exp: '5 years',
//   ),
//   AstrologerDetailsList(
//     image: "assets/images/astrologers/astro1.jpg",
//     title: "Astrologer",
//     // orders: '458',
//     // fees: 'Rs 15/min',
//     // cat: 'Numerology, vastu',
//     // language: 'Hindi, English',
//     // exp: '5 years',
//   ),
// ];

// class AstrologerDetailContent extends StatelessWidget {
//   const AstrologerDetailContent({
//     super.key,
//     required this.image,
//     required this.title,
//     // required this.orders,
//     // required this.fees,
//     // required this.cat,
//     // required this.language,
//     // required this.exp
//   });
//   final String image, title;
//   //orders, fees, cat, language, exp;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//           height: MediaQuery.of(context).size.height,
//           // height: 150,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.white.withOpacity(0.2)),
//           child: Column(
//             children: [
//               Image.asset(
//                 image,
//                 height: 55,
//                 width: 55,
//               ),
//               Text(
//                 title,
//                 style: TextStyle(color: textColor()),
//               )
//             ],
//           )),
//     );
//   }
// }
