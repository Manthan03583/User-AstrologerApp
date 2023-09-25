import 'package:astrology_app/controllers/controllers.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:flutter/material.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  List<User> users = [
    User(
      name: 'Anamika',
      username: 'Anamika_Goenka01',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Rahul Meher',
      username: 'Rahul_Meher11',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Deepali',
      username: 'Deepali_das95',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Smita',
      username: 'Fudgie_Tinker',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Shreya',
      username: 'Sherya_Ray18',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Aksah',
      username: 'Akash_Khanduja22',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Swapna',
      username: 'Swapna_Rana28',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Siddha',
      username: 'Siddha_Pragya1',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Anjali Samantaray',
      username: 'Anjie_Sam21',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Sunaina ',
      username: 'Sunu_Pattnayak0001',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Kavya Roy Choudhury ',
      username: 'Kavya_RC99',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
    User(
      name: 'Palak Agrawal ',
      username: 'Falak_Tak',
      image: 'assets/images/boy-dp.jpg',
      onClick: false,
    ),
  ];

  Future<void> getFollowingData() async {
    final data = await Controller.fetchFollowingList();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(data.toString())));
  }

  @override
  void initState() {
    getFollowingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HadLineP(
                  text: 'My Followings (${users.length})',
                ),
                const Icon(Icons.swap_vert_outlined)
              ],
            ),

            const SizedBox(
              height: 25,
            ),

            Flexible(
              flex: 1,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return userComponet(
                    user: users[index],
                  );
                },
              ),
            ),

            // Image.asset('assets/images/boy-dp.jpg')
          ],
        ),
      ),
    );
  }

  Widget userComponet({required User user}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  user.image,
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.20,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  user.username,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 40,
            width: 90,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const BasicsKundliPage()));
                setState(() {
                  user.onClick = !user.onClick;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    user.onClick ? Colors.white.withOpacity(0.1) : Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: Text(
                user.onClick ? 'Following':'Follow' ,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String username;
  final String image;
  bool onClick;

  User(
      {required this.name,
      required this.username,
      required this.image,
      required this.onClick});
}
