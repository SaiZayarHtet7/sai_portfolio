import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  Color primary() => Theme.of(this).colorScheme.primary;
  Color secondary() => Theme.of(this).colorScheme.secondary;
  Color backGround() => Theme.of(this).colorScheme.background;
  Color surface() => Theme.of(this).colorScheme.surface;
  Color textColor() => Theme.of(this).textTheme.bodyMedium!.color!;

  // Color subMenuBackground() => Theme.of(this).colorScheme.sca;
  // Color borderColor() => Theme.of(this).colorScheme.inversePrimary;
}

//  primary: ColorManager.primary,
//         surface: ColorManager.su,
//         background: null,
//         secondary: null,
//         brightness: null,
//         error: null,
//         onBackground: null,
//         onError: null,
//         onPrimary: null,
//         onSecondary: null,
//         onSurface: null,