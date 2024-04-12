import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(Sizes.size16),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size32),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
              color: _isSelected ? Colors.white : Colors.black87,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
