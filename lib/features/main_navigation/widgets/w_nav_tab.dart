import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  const NavTab(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.icon,
      required this.onTap,
      required this.selectedIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          // color: Colors
          //     .pink, //⚠️ change the color here to see how much space to take to detect the tap
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isSelected ? 1 : 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(isSelected ? selectedIcon : icon, color: Colors.white),
                Gaps.v5,
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
