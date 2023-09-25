import 'dart:ui';
import 'package:astrology_app/controllers/controllers.dart';
import 'package:astrology_app/profile/user_all_calss.dart';
import 'package:astrology_app/screens/user_blog/blog_details_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final Controller _controller = Controller();

  String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('dd MMM y').format(dateTime);
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                flex: 1,
                child: FutureBuilder<List<Blog>>(
                  future: _controller.getBlog(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Blog>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    } else {
                      final List<Blog> blogList = snapshot.data!;
                      return ListView.builder(
                          itemCount: blogList.length,
                          itemBuilder: (context, index) {
                            final blog = blogList[index];
                            return logB(blog: blog);
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logB({required Blog blog}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BlogDetailsPage(blog: blog,)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.network(
                      blog.image,
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.95,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 240,
                      top: 10,
                      child: buildBlur(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.22,
                          color: const Color.fromARGB(255, 224, 223, 223)
                              .withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  blog.totalViews.toString() ,
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
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      blog.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      blog.author,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      (blog.dateTime.isNotEmpty) ? formatDate(blog.dateTime) : " ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
        ),
      );
}

class Blog {
  final String id;
  final String image;
  final String description;
  final String author;
  final String dateTime;
  final String title;
  final String totalViews;

  Blog({
    required this.id,
    required this.description,
    required this.author,
    required this.dateTime,
    required this.title,
    required this.image,
    required this.totalViews,
  });
}
