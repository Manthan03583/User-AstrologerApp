import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'user_all_calss.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(children: [
            const HadLineP(
              text: 'Profile',
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/astrologers/astro5.jpg')),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.6), width: 5),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            UserAllButtonPage(
                btnText: 'Edit profile',
                pressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()));
                }),
            const SizedBox(
              height: 15,
            ),
            const Profile(
              text: 'Saved Payment Details',
              icon: Icons.payment_rounded,
            ),
            // const SizedBox(
            //   height: 1,
            // ),
            const Profile(
              text: 'Change Phone Number',
              icon: Icons.phone_android_rounded,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            const Profile(
              text: 'Rate App ',
              icon: Icons.star_border_outlined,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            const Profile(
              text: 'About US',
              icon: Icons.payment_rounded,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            const Profile(
              text: 'Terms & Conditions',
              icon: Icons.payment_rounded,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            const Profile(
              text: 'Logout',
              icon: Icons.logout_sharp,
            ),
          ]),
        ),
      ),
    );
  }
}
