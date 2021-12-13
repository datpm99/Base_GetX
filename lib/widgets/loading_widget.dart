import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({
    Key? key,
    this.size = 64.0,
    this.bgColor = Colors.white,
    this.padding = 20.0
  }) : super(key: key);
  final double size;
  final Color bgColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
