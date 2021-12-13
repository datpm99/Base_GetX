import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  const IconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.size = 24,
    this.color = Colors.grey,
  }) : super(key: key);
  final VoidCallback onTap;
  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, size: size, color: color),
    );
  }
}
