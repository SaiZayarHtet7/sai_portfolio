import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String image;
  final double? width, height;
  final Alignment? alignment;
  final BoxFit? fit;
  const MyImage(
      {super.key,
      required this.image,
      this.width,
      this.height,
      this.alignment,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
      fit: fit,
    );
  }
}
