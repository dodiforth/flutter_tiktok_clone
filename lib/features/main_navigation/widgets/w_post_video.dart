import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostVideoButton extends StatelessWidget {
  final bool onTapDown;
  //bool inverted;

  const PostVideoButton({super.key, required this.onTapDown});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: 1,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 21,
            child: Container(
              width: 25,
              height: 30,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: onTapDown
                    ? Theme.of(context).primaryColor
                    : const Color.fromRGBO(85, 183, 198, 1),
                borderRadius: BorderRadius.circular(Sizes.size6),
              ),
            ),
          ),
          Positioned(
            left: 21,
            child: Container(
              width: 25,
              height: 30,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: onTapDown
                    ? const Color.fromRGBO(85, 183, 198, 1)
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size6),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Sizes.size6),
            ),
            height: 30,
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
