import 'package:flutter/material.dart';

import '../profile/user_all_calss.dart';

class DashaKundliPage extends StatefulWidget {
  const DashaKundliPage({super.key});

  @override
  State<DashaKundliPage> createState() => _DashaKundliPageState();
}

class _DashaKundliPageState extends State<DashaKundliPage> {
  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: width * 0.023),
        child: Column(
          children: [
            const KPage(text: 'Mahadasha'),
            SizedBox(
              height: width * 0.04,
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.20,
              width: width * 0.95,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.045, right: width * 0.045, top: width * 0.035, bottom: width * 0.035),
                child: Table(
                  children: const [
                    TableRow(
                      children: [
                        Text("Planet ", style: TextStyle(color: Colors.white)),
                        Text("Start Date",
                            style: TextStyle(color: Colors.white)),
                        Text("End Date", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("MA ", style: TextStyle(color: Colors.white)),
                        Text("01-Mar-1998",
                            style: TextStyle(color: Colors.white)),
                        Text("01-Mar-1998",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("RA ", style: TextStyle(color: Colors.white)),
                        Text("01-Mar-2005",
                            style: TextStyle(color: Colors.white)),
                        Text("01-Mar-1998",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("JU ", style: TextStyle(color: Colors.white)),
                        Text("02-Mar-2023",
                            style: TextStyle(color: Colors.white)),
                        Text("02-Mar-2039",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("SA", style: TextStyle(color: Colors.white)),
                        Text("02-Mar-2039",
                            style: TextStyle(color: Colors.white)),
                        Text("01-Mar-2058",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("ME", style: TextStyle(color: Colors.white)),
                        Text("01-Mar-2058",
                            style: TextStyle(color: Colors.white)),
                        Text("02-Mar-2075",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("KE", style: TextStyle(color: Colors.white)),
                        Text("02-Mar-2075",
                            style: TextStyle(color: Colors.white)),
                        Text("01-Mar-2082",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("VE", style: TextStyle(color: Colors.white)),
                        Text("01-Mar-2082",
                            style: TextStyle(color: Colors.white)),
                        Text("02-Mar-2102",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: width * 0.04,
            ),
            const KPage(text: 'Understanding your dasha'),
            SizedBox(
              height: width * 0.04,
            ),
            const DPage(
              text: 'Moon Mahadasha (01/03/1988-02/03/1998)',
              text1:
                  "Yo, this job is hella hard work, but we gotta do it. \nGotta follow the rules and get rid of the stuff we \ndon't want. Man, sometimes it's a pain in the butt. \nBut we gotta do what we gotta do, right?\nDealing with bills and expenses can be a drag, \nbut at least we can enjoy the good stuff in life. \nSometimes we gotta say no to things we want, but \nit's all good. We'll get by.\nLife can be a real pain sometimes, with all these \nproblems and headaches. But we gotta keep \npushing through and not let it get us down. Gotta \nkeep on truckin' and find the silver lining.",
              text2:
                  "Hey, this job is seriously tough, but it's our \nresponsibility. Gotta stick to the rules and toss out \nthe unwanted stuff. It can be a real pain in the butt \nsometimes, but that's just the way it is, right?\nManaging bills and expenses can be such a drag, \nbut we still gotta enjoy the good things in life. \nSometimes we gotta pass on things we really want, \nbut it's all good. We'll get through it.\nLife can be a real bummer with all these problems \nand headaches, but we can't let it get us down. \nGotta keep truckin' and find the bright side.",
            ),
            const SizedBox(
              height: 20,
            ),
            const DashaPage(
              text: 'Rahu Mahadasha (01/03/1988-02/03/1998)',
              text1:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
              text2:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
            ),
            const SizedBox(
              height: 20,
            ),
            const DashaPage(
              text: 'Saturn Mahadasha (01/03/1988-02/03/1998)',
              text1:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
              text2:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
            ),
            const SizedBox(
              height: 20,
            ),
            const DashaPage(
              text: 'Mercury Mahadasha (01/03/1988-02/03/1998)',
              text1:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
              text2:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
            ),
            const SizedBox(
              height: 20,
            ),
            const DashaPage(
              text: 'Ketu Mahadasha (01/03/1988-02/03/1998)',
              text1:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
              text2:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
            ),
            const SizedBox(
              height: 20,
            ),
            const DashaPage(
              text: 'Sun Mahadasha (01/03/1988-02/03/1998)',
              text1:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
              text2:
                  "Ut laboriosam ipsa tenetur totam id nam similique \npraesentium. Sequi eos cum in officia ut \nrepellendus unde repudiandae. A id alias quis \nconsequatur commodi maxime magni voluptatem \ndoloribus.\nDebitis debitis et voluptatem occaecati. Fugit \ncum eius qui ut et quia est quaerat. Reiciendis \noptio quibusdam quia vel quis est reprehenderit.\nNon sit et hic omnis omnis dolores accusamus esse. Accusamus \nest perferendis asperiores tempore asperiores \ntotam. Est alias sed atque \ndebitis enim pariatur magnam officiis delectus. \nNulla facere architecto.",
            ),
          ],
        ),
      ),
    );
  }
}
