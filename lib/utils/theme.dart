import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xff460a07), //0xff880004
      secondary: Color(0xfffdd96a),
      surface: Color(0xffa12628),
      onSurface: Color(0xfffddc7b),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        primary: Color(0xfffdd96a), //od-->0xfffddc7b
        secondary: Color(0xff880004),
        surface: Color(0xff880004),
        onSurface: Color(0xff370705)),
  );
}
