//import 'package:astrology_app/constants/keys.dart';
import 'package:astrology_app/controllers/controllers.dart';
import 'package:astrology_app/screens/user_blog/blog_details_page.dart';
import 'package:astrology_app/screens/user_blog/blog_page.dart';
import 'package:astrology_app/utils/properties.dart';
import 'package:flutter/material.dart';

class DashboardBlog extends StatefulWidget {
  const DashboardBlog({super.key});

  @override
  State<DashboardBlog> createState() => _DashboardBlogState();
}

class _DashboardBlogState extends State<DashboardBlog> {
  final Controller _controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: FutureBuilder<List<Blog>>(
          future: _controller.getBlog(),
          builder: (BuildContext context, AsyncSnapshot<List<Blog>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            } else {
              final List<Blog> blogList = snapshot.data!;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: blogList.length,
                  itemBuilder: (context, index) => BlogContent(blog: blogList[index],));
            }
          },
        ),
      ),
    );
  }
}

class BlogContent extends StatelessWidget {
  const BlogContent({
    Key? key, required this.blog,
  }) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BlogDetailsPage(blog: blog,)));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.amber
                  ),
                  child: Image.network(
                    blog.image,
                    height: 100,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                blog.title,
                style: TextStyle(color: textColor(), fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
