import 'package:base_getx/const/const.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color = Styles.primaryColor,
    this.borderRadius = 5.0,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final Color color;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onTap,
      child: Text(text, style: Styles.normalTextBold(color: Colors.white)),
    );
  }
}
