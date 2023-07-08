import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/util/util.dart';

import 'modules/home/home.dart';

GlobalKey materialKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: materialKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: ColorUtils.primaryColor,

        colorScheme: ColorScheme(
          primary: ColorUtils.primaryColor,
          surface: ColorUtils.surfaceColor,
          background: ColorUtils.backgroundColor,
          secondary: ColorUtils.secondaryColor,
          brightness: Brightness.dark,
          error: Colors.red,
          onBackground: ColorUtils.backgroundColor,
          onError: Colors.red,
          onPrimary: ColorUtils.primaryColor,
          onSecondary: ColorUtils.secondaryColor,
          onSurface: ColorUtils.surfaceColor,
        ),

        // Define the default font family.
        fontFamily: Constants.jetBrainFont,
        scaffoldBackgroundColor: ColorUtils.backgroundColor,

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          titleLarge: FontUtils.titleLarge,
          titleMedium: FontUtils.titleMedium,
          titleSmall: FontUtils.titleSmall,
          bodyMedium: FontUtils.bodyMedium,
          bodyLarge: FontUtils.bodyLarge,
          bodySmall: FontUtils.bodySmall,
        ),
      ),
      home: const HomePage(),
    );
  }
}
