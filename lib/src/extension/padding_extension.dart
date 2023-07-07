import 'package:flutter/material.dart';

extension PaddingExtension on int {
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());
}

extension PaddingWidgetExtension on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );
  Widget paddingHorizontal(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );
  Widget paddingVertical(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );
}
