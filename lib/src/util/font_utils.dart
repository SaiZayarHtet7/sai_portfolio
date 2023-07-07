import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/util/util.dart';

class FontUtils {
  static TextStyle titleLarge = TextStyle(
    fontFamily: Constants.cerebriFont,
    fontWeight: FontWeight.w800,
    color: ColorUtils.textColor,
    fontSize: 30,
  );

  static TextStyle titleMedium = TextStyle(
    fontFamily: Constants.jetBrainFont,
    fontWeight: FontWeight.normal,
    color: ColorUtils.textColor,
    fontSize: 30,
  );
  static TextStyle titleSmall = TextStyle(
    fontFamily: Constants.jetBrainFont,
    fontWeight: FontWeight.normal,
    color: ColorUtils.textColor,
    fontSize: 23,
  );

  static TextStyle bodyLarge = TextStyle(
    fontFamily: Constants.jetBrainFont,
    fontWeight: FontWeight.normal,
    color: ColorUtils.textColor,
    fontSize: 20,
  );
  static TextStyle bodyMedium = TextStyle(
    fontFamily: Constants.jetBrainFont,
    fontWeight: FontWeight.normal,
    color: ColorUtils.textColor,
    fontSize: 15,
  );
  static TextStyle bodySmall = TextStyle(
    fontFamily: Constants.jetBrainFont,
    color: ColorUtils.textColor,
    fontWeight: FontWeight.normal,
    fontSize: 13,
  );
}
