import 'package:astrology_app/screens/stories/animatedbar.dart';
import 'package:astrology_app/screens/stories/data/data.dart';
import 'package:astrology_app/screens/stories/models/story_model.dart';
import 'package:astrology_app/screens/stories/models/user_models.dart';
import 'package:astrology_app/screens/stories/userinfo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  final User user;
  final List<Story> stories;
  const StoryScreen({super.key, required this.stories, required this.user});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  late VideoPlayerController _videoPlayerController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _animationController = AnimationController(vsync: this);
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.stories[2].url));

    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _animationController.reset();

        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex],animateToPage: true);
          } else {
            _currentIndex = 0;
            _loadStory(story: widget.stories[_currentIndex],animateToPage: true);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];

    return Scaffold(
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: [
            PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: widget.stories.length,
              itemBuilder: (context, index) {
                final Story story = widget.stories[index];
                // _loadStory(story: story);
                switch (story.media) {
                  case MediaType.image:
                    return CachedNetworkImage(
                      imageUrl: story.url,
                      fit: BoxFit.cover,
                    );
                  case MediaType.video:
                    if (_videoPlayerController != null &&
                        _videoPlayerController.value.isInitialized) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoPlayerController.value.size.width,
                          height: _videoPlayerController.value.size.height,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      );
                    }
                }

                return const SizedBox.shrink();
              },
            ),
            Positioned(
              top: 40.0,
              left: 10.0,
              right: 10.0,
              child: Column(
                children: [
                  Row(
                    children: widget.stories
                        .asMap()
                        .map((i, e) {
                          return MapEntry(
                              i,
                              AnimatedBar(
                                animationController: _animationController,
                                position: i,
                                currentIndex: _currentIndex,
                              ),);
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1.5,
                      vertical: 10.0,
                    ),
                    child: UserInfo(user: widget.user),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animationController.stop();
    _animationController.reset();

    switch (story.media) {
      case MediaType.image:
        _animationController.duration = story.duration;
        _animationController.forward();
        break;

      case MediaType.video:
        _videoPlayerController?.dispose();
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(story.url))
              ..initialize().then((_) {
                setState(() {});

                if (_videoPlayerController.value.isInitialized) {
                  _animationController.duration =
                      _videoPlayerController.value.duration;
                  _videoPlayerController.play();
                  _animationController.forward();
                }
              });
        break;
    }

    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_currentIndex],animateToPage: true);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex],animateToPage: true);
        } else {
          _currentIndex = 0;
          _loadStory(story: widget.stories[_currentIndex],animateToPage: true);
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (_videoPlayerController.value.isPlaying) {
          _videoPlayerController.pause();
          _animationController.stop();
        } else {
          _videoPlayerController.play();
          _animationController.forward();
        }
      }
    }
  }
}
