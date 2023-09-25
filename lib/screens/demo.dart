import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/properties.dart';
//import 'chat/chat_inbox_list.dart';

// class DemoPage extends StatefulWidget {
//   const DemoPage({super.key});

//   @override
//   State<DemoPage> createState() => _DemoPageState();
// }

// class _DemoPageState extends State<DemoPage> {
//   int radius = 250;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: GestureDetector(
//           onPanUpdate: _panHandler,
//           child: Container(
//             height: radius * 2,
//             width: radius * 2,
//             decoration: BoxDecoration(
//                 //shape: BoxShape.circle,
//                 //color: Colors.red,
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/radial_img.png"),
//                     fit: BoxFit.contain)),
//           )),
//     );
//   }

//   void _panHandler(DragUpdateDetails d) {
//     //double rotationalChange = (horizontal + vertical) * d.delta.distance;

//     /// Pan location on the wheel
//     bool onTop = d.localPosition.dy <= radius;
//     bool onLeftSide = d.localPosition.dx <= radius;
//     bool onRightSide = !onLeftSide;
//     bool onBottom = !onTop;

//     /// Pan movements
//     bool panUp = d.delta.dy <= 0.0;
//     bool panLeft = d.delta.dx <= 0.0;
//     bool panRight = !panLeft;
//     bool panDown = !panUp;

//     /// Absoulte change on axis
//     double yChange = d.delta.dy.abs();
//     double xChange = d.delta.dx.abs();

//     /// Directional change on wheel
//     double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
//         ? yChange
//         : yChange * -1;

//     double horizontalRotation =
//         (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

//     // Total computed change
//     double rotationalChange = verticalRotation + horizontalRotation;

//     bool movingClockwise = rotationalChange > 0;
//     bool movingCounterClockwise = rotationalChange < 0;

//     // Now do something interesting with these computations!
//   }
// }

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue,
                Color.fromARGB(255, 133, 198, 230),
              ], begin: Alignment.center, end: Alignment.bottomCenter),
            ),
          ),
          //.............Menu..............//
          SafeArea(
            minimum: const EdgeInsets.all(8),
            child: SizedBox(
              width: 200,
              child: Column(
                children: [
                  const DrawerHeader(
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      size: 15,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: textColor()),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      size: 15,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: textColor()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              duration: Duration(milliseconds: 500),
              tween: Tween<double>(begin: 0, end: value),
              builder: (context, value, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..setEntry(0, 3, 200 * value)
                    ..rotateY((pi / 7) * value),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Scaffold(
                      backgroundColor: Colors.amber[50],
                      appBar: AppBar(
                        leading: GestureDetector(
                          onTap: () {
                            drawerItem();
                            // setState(() {
                            //   value == 0 ? value = 1 : value = 0;
                            // });
                          },
                          child: Icon(
                            Icons.menu,
                            size: 35,
                            color: Colors.black,
                          ),
                        ),
                        title: Text("vtfffyg"),
                        backgroundColor: Colors.green,
                      ),
                      body: SafeArea(
                        child: Column(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                " Daily Horoscope",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Center(
                            child: Text("Swipe to see Side MenuBar"),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              }),
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       value == 0 ? value = 1 : value = 0;
          //     });
          //   },
          // )
          GestureDetector(
            onTap: () {
              setState(() {
                value == 0 ? value = 1 : value = 0;
              });
            },
            child: const Center(
              child: Icon(
                Icons.menu,
                size: 35,
                color: Colors.black,
              ),
            ),
          )
        ],
        // child: ListView.builder(
        //     itemCount: chatlistInbox.length,
        //     itemBuilder: ((context, index) => StickyHeader(
        //         header: Row(
        //           children: [
        //             const Icon(
        //               Icons.keyboard_arrow_left,
        //               color: Colors.white,
        //               size: 30,
        //             ),
        //             const SizedBox(
        //               width: 8,
        //             ),
        //             Text(
        //               "Chats",
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .headlineSmall!
        //                   .copyWith(
        //                       fontWeight: FontWeight.w500,
        //                       color: textColor()),
        //             ),
        //           ],
        //         ),
        //         content: ChatContent(
        //           name: chatlistInbox[index].name,
        //           image: chatlistInbox[index].img,
        //           text: chatlistInbox[index].text,
        //         ))))
      ),
    );
  }

  void drawerItem() {
    setState(() {
      value == 0 ? value = 1 : value = 0;
    });
  }
}

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
