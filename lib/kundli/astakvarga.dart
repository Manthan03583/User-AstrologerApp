// import 'package:astrology_app/screens/kundli/nested_bar_page.dart';
import 'package:astrology_app/kundli/nested_bar_page.dart';
//import 'package:astrology_app/screens/kundli/nested_bar_page.dart';
import 'package:flutter/material.dart';

import '../profile/user_all_calss.dart';

class AstakvargaTabPage extends StatefulWidget {
  const AstakvargaTabPage({super.key});

  @override
  State<AstakvargaTabPage> createState() => _AstakvargaTabPageState();
}

class _AstakvargaTabPageState extends State<AstakvargaTabPage> {
  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: width * .024),
        child: Column(
          children: [
            const KPage(text: 'Ashtakvarga Chart'),
            SizedBox(
              height: width * .03,
            ),
            Padding(
              padding: EdgeInsets.all(width * .024),
              child: Text(
                "Ut laboriosam ipsa tenetur totam id nam similique\npraesentium. Sequi eos cum in officia ut repellendus\nunde repudiandae. A id alias quis consequatur\ncommodi maxime magni voluptatem doloribus.\nDebitis debitis et voluptatem occaecati. Fugit cum eius\nqui ut et quia est quaerat. Reiciendis optio quibusdam\nquia vel quis est reprehenderit. Non sit et hic omnis\nomnis dolores accusamus esse. Accusamus est\nperferendis asperiores tempore asperiores totam. Est\nalias sed atque debitis enim pariatur magnam officiis\ndelectus. Nulla facere architecto",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white, fontSize: width * .03),
              ),
            ),
            SizedBox(
              height: width * .03,
            ),
            SizedBox(height: width * .1, child: const AstakPage()),
            //const SizedBox(height: 35),
            SizedBox(
              height: width * .1,
            ),
            Image.asset(
              'assets/images/ashtakvarga.png',
              width: width * 0.99,
            ),
          ],
        ),
      ),
    );
  }
}
