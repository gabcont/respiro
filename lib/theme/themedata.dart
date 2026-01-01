import 'package:flutter/material.dart';

import 'colors.dart';

class RespiroTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor:Colors.lightBlue, brightness: Brightness.light),
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: [
      BreathingColors.light,
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor:Colors.blue, brightness: Brightness.dark),
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: [
      BreathingColors.dark,
    ],
  );

}