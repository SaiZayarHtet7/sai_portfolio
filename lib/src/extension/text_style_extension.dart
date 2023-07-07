import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextStyle getBodyMedium() => Theme.of(this).textTheme.bodyMedium!;
  TextStyle getBodyLarge() => Theme.of(this).textTheme.bodyLarge!;
  TextStyle getBodySmall() => Theme.of(this).textTheme.bodySmall!;
  TextStyle getTitleLarge() => Theme.of(this).textTheme.titleLarge!;
  TextStyle getTitleMedium() => Theme.of(this).textTheme.titleMedium!;
  TextStyle getTitleSmall() => Theme.of(this).textTheme.titleSmall!;
}
