import 'package:astrology_app/screens/stories/data/data.dart';
//import 'package:astrology_app/screens/stories/models/user_models.dart';
import 'package:astrology_app/screens/stories/storyscreen.dart';
import 'package:flutter/material.dart';

class ProfileStoriesList extends StatefulWidget {
  const ProfileStoriesList({super.key});

  @override
  State<ProfileStoriesList> createState() => _ProfileStoriesListState();
}

class _ProfileStoriesListState extends State<ProfileStoriesList> {
  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: ListView.builder(
            // separatorBuilder: (context, index) {
            //   return Container(
            //     width: 5,
            //     color: Colors.black,
            //   );
            // },
            itemCount: users.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(left: height * 0.005 , right: height * 0.005),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> StoryScreen(stories: stories, user: users[index],)));
                  },
                  child: SizedBox(
                    //color: Colors.black,
                    width: width * 0.23,
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.1,
                          width: height * 0.1,
                          //margin: const EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                users[index].profileImageUrl.toString(),
                              ),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          users[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
