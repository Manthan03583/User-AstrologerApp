import 'dart:async';
import 'package:astrology_app/controllers/splash_controller.dart';
import 'package:astrology_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  OnBoardingState createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.signIn);
                        Get.find<SplashController>()
                                .saveSplashSeenValue(true);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          side: const BorderSide(
                            color: Colors.blue,
                          )),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: PageView.builder(
                  itemCount: onBoardingPage.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardingPage(
                    imageAsset: onBoardingPage[index].imageAsset,
                    title: onBoardingPage[index].title,
                    description: onBoardingPage[index].description,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    onBoardingPage.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.90,
                child: ElevatedButton(
                    onPressed: () {
                      if (_pageIndex == onBoardingPage.length - 1) {
                        Get.offAllNamed(Routes.signIn);
                        Get.find<SplashController>()
                                .saveSplashSeenValue(true);
                      }
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    //const CircleBorder()),
                    child: Text(
                      _pageIndex == onBoardingPage.length - 1
                          ? "Login"
                          : "Next",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                    //Icon(Icons.arrow_forward)
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingInfo {
  late final String imageAsset, title, description;

  OnBoardingInfo({
    required this.imageAsset,
    required this.title,
    required this.description,
  });
}

final List<OnBoardingInfo> onBoardingPage = [
  OnBoardingInfo(
      imageAsset: "assets/images/splash/splash1.png",
      title: "Horoscope",
      description:
          "Lorem ipsum dolor sit amet, consectetuer\n elit, sed diam nonummy nibh euismod\n aoreet dolore magna aliquam "),
  OnBoardingInfo(
      imageAsset: "assets/images/splash/page2.png",
      title: "Birth Sign",
      description:
          "Lorem ipsum dolor sit amet, consectetuer\n elit, sed diam nonummy nibh euismod\n aoreet dolore magna aliquam "),
  OnBoardingInfo(
      imageAsset: "assets/images/splash/page3.png",
      title: "Numerology",
      description:
          "Lorem ipsum dolor sit amet, consectetuer\n elit, sed diam nonummy nibh euismod\n aoreet dolore magna aliquam "),
];

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String imageAsset, title, description;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  double _height = 0.01;
  double _width = 0.01;

  void update() {
    setState(() {
      _height = 0.35;
      _width = 0.75;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 300), () {
      update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: MediaQuery.of(context).size.width * _width,
            height: MediaQuery.of(context).size.height * _height,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 3),
            child: Image.asset(
              widget.imageAsset,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 10 : 4,
      width: 20,
      decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          )),
    );
  }
}
