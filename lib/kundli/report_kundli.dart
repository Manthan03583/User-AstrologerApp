import 'package:flutter/material.dart';
import '../profile/user_all_calss.dart';

class ReportKundliPage extends StatefulWidget {
  const ReportKundliPage({super.key});

  @override
  State<ReportKundliPage> createState() => _ReportKundliPageState();
}

class _ReportKundliPageState extends State<ReportKundliPage> {
  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(width * 0.025),
        child: Column(
          children: [
            const CKPage(
              text: 'Description',
              text1:
                  'Ut laboriosam ipsa tenetur totam id nam similique praesentium. Sequi eos cum in officia ut repellendus unde repudiandae. A id alias quis consequatur commodi maxime magni voluptatem doloribus. Debitis debitis et voluptatem occaecati. Fugit cum eius qui ut et quia est quaerat. Reiciendis optio quibusdam quia vel quis est reprehenderit. Non sit et hic omnis omnis dolores accusamus esse. Accusamus est perferendis asperiores tempore asperiores totam. Est alias sed atque debitis enim pariatur magnam officiis delectus. Nulla facere architecto.',
            ),
            SizedBox(
                height: width * 0.035,
              ),
            const CKPage(
              text: 'Personality',
              text1:
                  'Ut laboriosam ipsa tenetur totam id nam similique praesentium. Sequi eos cum in officia ut repellendus unde repudiandae. A id alias quis consequatur commodi maxime magni voluptatem doloribus. Debitis debitis et voluptatem occaecati. Fugit cum eius qui ut et quia est quaerat. Reiciendis optio quibusdam quia vel quis est reprehenderit. Non sit et hic omnis omnis dolores accusamus esse. Accusamus est perferendis asperiores tempore asperiores totam. Est alias sed atque debitis enim pariatur magnam officiis delectus. Nulla facere architecto.',
            ),
            SizedBox(
                height: width * 0.035,
              ),
            const CKPage(
              text: 'Physical',
              text1:
                  'Ut laboriosam ipsa tenetur totam id nam similique praesentium. Sequi eos cum in officia ut repellendus unde repudiandae. A id alias quis consequatur commodi maxime magni voluptatem doloribus. Debitis debitis et voluptatem occaecati. Fugit cum eius qui ut et quia est quaerat. Reiciendis optio quibusdam quia vel quis est reprehenderit. Non sit et hic omnis omnis dolores accusamus esse. Accusamus est perferendis asperiores tempore asperiores totam. Est alias sed atque debitis enim pariatur magnam officiis delectus. Nulla facere architecto.',
            ),
            SizedBox(
              height: width * 0.035,
            ),
            const CKPage(
              text: 'Health',
              text1:
                  'Ut laboriosam ipsa tenetur totam id nam similique praesentium. Sequi eos cum in officia ut repellendus unde repudiandae. A id alias quis consequatur commodi maxime magni voluptatem doloribus. Debitis debitis et voluptatem occaecati. Fugit cum eius qui ut et quia est quaerat. Reiciendis optio quibusdam quia vel quis est reprehenderit. Non sit et hic omnis omnis dolores accusamus esse. Accusamus est perferendis asperiores tempore asperiores totam. Est alias sed atque debitis enim pariatur magnam officiis delectus. Nulla facere architecto.',
            ),
            SizedBox(
              height: width * 0.035,
            ),
            const CKPage(
              text: 'Career',
              text1:
                  'Ut laboriosam ipsa tenetur totam id nam similique praesentium. Sequi eos cum in officia ut repellendus unde repudiandae. A id alias quis consequatur commodi maxime magni voluptatem doloribus. Debitis debitis et voluptatem occaecati. Fugit cum eius qui ut et quia est quaerat. Reiciendis optio quibusdam quia vel quis est reprehenderit. Non sit et hic omnis omnis dolores accusamus esse. Accusamus est perferendis asperiores tempore asperiores totam. Est alias sed atque debitis enim pariatur magnam officiis delectus. Nulla facere architecto.',
            ),
            SizedBox(
              height: width * 0.035,
            ),
            const CKPage(
              text: 'Relationship',
              text1:
                  'Ut laboriosam ipsa tenetur totam id nam similique praesentium. Sequi eos cum in officia ut repellendus unde repudiandae. A id alias quis consequatur commodi maxime magni voluptatem doloribus. Debitis debitis et voluptatem occaecati. Fugit cum eius qui ut et quia est quaerat. Reiciendis optio quibusdam quia vel quis est reprehenderit. Non sit et hic omnis omnis dolores accusamus esse. Accusamus est perferendis asperiores tempore asperiores totam. Est alias sed atque debitis enim pariatur magnam officiis delectus. Nulla facere architecto.',
            ),
          ],
        ),
      ),
    );
  }
}
