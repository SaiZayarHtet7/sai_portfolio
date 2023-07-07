import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/util/util.dart';

extension SizeExtension on BuildContext {
  double get dw => MediaQuery.of(this).size.width;
  double get dh => MediaQuery.of(this).size.height;

  bool get isLaptop => MediaQuery.of(this).size.width >= Constants.laptop;
  bool get isNotLaptop => MediaQuery.of(this).size.width < Constants.laptop;

  bool get isTablet =>
      MediaQuery.of(this).size.width < Constants.laptop &&
      MediaQuery.of(this).size.width >= Constants.tablet;

  bool get isMobile => MediaQuery.of(this).size.width < Constants.tablet;
  bool get isNotMobile => MediaQuery.of(this).size.width >= Constants.tablet;

  // Color subMenuBackground() => Theme.of(this).colorScheme.sca;
  // Color borderColor() => Theme.of(this).colorScheme.inversePrimary;
}
