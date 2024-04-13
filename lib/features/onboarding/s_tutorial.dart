import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/gaps.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/main_navigation/s_main_navigation.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false, // remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            child: SafeArea(
              child: AnimatedCrossFade(
                firstChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    const Text(
                      "Watch cool videos!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    const Text(
                      "Create your own videos!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Show your creativity and share y our life with the world.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
                crossFadeState: _showingPage == Page.first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            surfaceTintColor: Colors.white,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size3, horizontal: Sizes.size3),
              child: AnimatedOpacity(
                opacity: _showingPage == Page.second ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: CupertinoButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: _onEnterAppTap,
                  child: const Text(
                    "Start the fun",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
