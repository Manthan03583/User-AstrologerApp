import 'dart:ui';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:astrology_app/screens/user_blog/blog_page.dart';
import 'package:flutter/material.dart';
class BlogDetailsPage extends StatefulWidget {
  const BlogDetailsPage({super.key, required this.blog});
  final Blog blog;

  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}
class _BlogDetailsPageState extends State<BlogDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HadLineP(
                      text: 'Blog',               
                    ),
                    IconButton(
                      onPressed: (){}, 
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.blog.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.network(
                            widget.blog.image,
                            height: MediaQuery.of(context).size.height*0.25,
                            width: MediaQuery.of(context).size.width*0.95,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 243,
                            top: 10,
                            child: buildBlur(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width*0.22,
                                color: const Color.fromARGB(255, 224, 223, 223).withOpacity(0.1),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 7,),
                                      Text(
                                        widget.blog.totalViews,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),        
                const SizedBox(height: 10),

                const BlogP(text: 'When a Libra man breaks up with you, it can \nbe a difficult and confusing time. Libra is an air \nsign, known for its charm, diplomacy, and love \nof balance and harmony. However, sometimes \neven the most balanced and harmonious \nrelationships can come to an end. When a \nLibra man is going through a break up, it’s \nimportant to understand the astrological traits \nthat may be influencing his behavior. By \nunderstanding the Libra man’s personality and \nmotivations, you can better navigate the \nbreakup process and move forward with \nclarity and grace.'),       
                      
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  const [
                      Text(
                        '7 traits of a Libra man after a breakup',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  const [
                      Text(
                        'Reflective',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),

                const BlogP(text: 'After a breakup, the reflective trait of a Libra \nman emerges. He contemplates his actions \nand analyzes the reasons behind the \nseparation. Transitioning from a state of \ntogetherness to solitude, he examines his \nemotions with utmost sincerity. With \nintrospection, he navigates through the \nrollercoaster of feelings. Throughout this \nprocess, he questions his role in the \nrelationship and ponders upon the lessons \nlearned. Embracing his independence, he \ncontemplates his future steps and the \npotential for personal growth\n\nThis trait enables him to reassess his priorities \nand redefine his desires. The reflective phase, \nthough challenging, offers a valuable \nopportunity for self-discovery and emotional \nhealing. Ultimately, the Libra man emerges \nfrom this breakup with a newfound \nunderstanding of himself and his needs, \npreparing him for future relationships with \ngreater clarity and balance.'),
                const SizedBox(height: 5 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  const [
                      Text(
                        'Also read: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Padding(
                        padding: EdgeInsets.only(top: 19),
                        child: Text(
                          'Can Astrology Predict the Exact \nTiming of marriage',
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 81, 214),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  const [
                      Text(
                        'Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const BlogP(text: 'After a Libra man breaks up, he strives to \nmaintain a balanced trait in his life. He \ncarefully evaluates his emotions and seeks \ninner peace. Transitioning from a relationship, \nhe reflects on his needs and desires. During \nthis period, he focuses on self-improvement \nand personal growth. He may engage in \nactivities that bring harmony and stability to \nhis life.\n\nHe seeks support from loved ones and \ncommunicates openly about his feelings. \nGradually, he regains his equilibrium and \nadapts to the new circumstances. In the \nprocess, he may seek professional advice or \ncounseling to assist in his healing journey. The \nLibra man remains patient and tolerant, \nunderstanding that time is essential for \nhealing. With a balanced approach, he \neventually emerges stronger, ready to \nembrace new experiences and build \nmeaningful connections in the future.'),
        
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  const [
                      Text(
                        'Amicable',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const BlogP(text: 'The Libra man break up can bring out his \namicable trait. He tends to handle the situation \nwith maturity and grace. Despite feeling hurt, \nhe will try to maintain a peaceful and \nrespectful relationship with his ex-partner. The \nLibra man understands the value of good \ncommunication and will express his thoughts \nand feelings with clarity.\n\nHe may take some time to recover from the \nbreakup, but he will not hold any grudges \nagainst his ex-partner. Instead, he will focus on \nfinding closure and moving on. The Libra man \nis skilled at finding balance in his life, and he \nwill use his strengths to overcome the \nchallenges of the breakup.\n\nDuring this time, he may seek the support of \nhis friends and family to help him cope with his \nemotions. He will also take this opportunity to \nreflect on the lessons learned from the \nrelationship and use them to improve himself.'),
        
                const SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  const [
                      Text(
                        'Also read: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Padding(
                        padding: EdgeInsets.only(top: 19),
                        child: Text(
                          'Can Astrology Predict the Exact \nTiming of marriage',
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 81, 214),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  const [
                      Text(
                        'Amicable',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const BlogP(text: "He may take some time to recover from the \nbreakup, but he will not hold any grudges \nagainst his ex-partner. Instead, he will focus on \nfinding closure and moving on. The Libra man \nis skilled at finding balance in his life, and he \nwill use his strengths to overcome the \nchallenges of the breakup.\n\nDuring this time, he may seek the support of \nhis friends and family to help him cope with his \nemotions. He will also take this opportunity to \nreflect on the lessons learned from the \nrelationship and use them to improve himself.")
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildBlur({
  required Widget child,
  double sigmaX = 10,
  double sigmaY = 10,
  required BorderRadius borderRadius,
  }) =>
  ClipRRect(
    borderRadius: borderRadius,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: child,
    )
  );
}