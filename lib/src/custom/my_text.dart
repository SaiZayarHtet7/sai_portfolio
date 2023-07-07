import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

class MyText extends StatelessWidget {
  final TextStyle? style;
  final String text;
  final int? maxLine;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  const MyText(this.text,
      {super.key, this.maxLine, this.textOverflow, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ??
          context
              .getBodyMedium()
              .copyWith(wordSpacing: 0, overflow: textOverflow),
      textScaleFactor: 1,
      maxLines: maxLine,
    );
  }
}
