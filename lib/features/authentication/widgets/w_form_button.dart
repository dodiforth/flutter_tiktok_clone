import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final String text;
  final bool disabled;

  const FormButton({
    super.key,
    required this.disabled,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: TextStyle(
            color: disabled ? Colors.grey : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
