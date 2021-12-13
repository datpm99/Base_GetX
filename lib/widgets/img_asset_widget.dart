import 'package:flutter/material.dart';

class ImgAssetWidget extends StatelessWidget {
  const ImgAssetWidget({
    Key? key,
    required this.img,
    this.size,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);
  final String img;
  final double? size;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(img, width: size, height: size, fit: fit, color: color);
  }
}
