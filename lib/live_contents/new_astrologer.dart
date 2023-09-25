import 'package:flutter/material.dart';

class NewAstrologer extends StatefulWidget {
  const NewAstrologer({super.key});

  @override
  State<NewAstrologer> createState() => _NewAstrologerState();
}

class _NewAstrologerState extends State<NewAstrologer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        //height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: astrologer.length,
            itemBuilder: ((context, index) => AstrologerNewContent(
                  image: astrologer[index].image,
                  title: astrologer[index].title,
                ))),
      ),
    );
  }
}

class AstrologerNew {
  late final String image, title;

  AstrologerNew({
    required this.image,
    required this.title,
  });
}

final List<AstrologerNew> astrologer = [
  AstrologerNew(
    image: "assets/images/astrologers/astro6.jpg",
    title: "Astrologer",
  ),
  AstrologerNew(
    image: "assets/images/astrologers/astro5.jpg",
    title: "Astrologer",
  ),
  AstrologerNew(
    image: "assets/images/astrologers/astro4.jpg",
    title: "Astrologer",
  ),
  AstrologerNew(
    image: "assets/images/astrologers/astro1.jpg",
    title: "Astrologer",
  ),
  AstrologerNew(
    image: "assets/images/astrologers/astro3.jpg",
    title: "Astrologer",
  ),
  AstrologerNew(
    image: "assets/images/astrologers/astro2.jpg",
    title: "Astrologer",
  ),
];

class AstrologerNewContent extends StatelessWidget {
  const AstrologerNewContent(
      {super.key, required this.image, required this.title});

  final String image, title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          Container(
            height: height,
            width: width * 0.314,
            padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: width * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.8),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: width * 0.01),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  image,
                  // height: 45,
                  // width: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: Container(
                height: width * 0.075,
                decoration: BoxDecoration(
                    color: Colors.red,
                    gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.9),
                      ],
                    ))),
          ),
          Positioned(
            bottom: width * 0.027,
            left: width * 0.07,
            right: width * 0.01,
            child: Text(title,
                style: const TextStyle(
                  // fontSize: 13,
                  // letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
