import 'package:flutter/material.dart';

MaterialColor PrimaryMaterialColor = const MaterialColor(
  4288847092,
  <int, Color>{
    50: Color.fromRGBO(
      162,
      156,
      244,
      .1,
    ),
    100: Color.fromRGBO(
      162,
      156,
      244,
      .2,
    ),
    200: Color.fromRGBO(
      162,
      156,
      244,
      .3,
    ),
    300: Color.fromRGBO(
      162,
      156,
      244,
      .4,
    ),
    400: Color.fromRGBO(
      162,
      156,
      244,
      .5,
    ),
    500: Color.fromRGBO(
      162,
      156,
      244,
      .6,
    ),
    600: Color.fromRGBO(
      162,
      156,
      244,
      .7,
    ),
    700: Color.fromRGBO(
      162,
      156,
      244,
      .8,
    ),
    800: Color.fromRGBO(
      162,
      156,
      244,
      .9,
    ),
    900: Color.fromRGBO(
      162,
      156,
      244,
      1,
    ),
  },
);

ThemeData myTheme = ThemeData(
  fontFamily: "customFont",
  primaryColor: const Color(0xffa29cf4),
  primarySwatch: PrimaryMaterialColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0xffa29cf4),
      ),
    ),
  ),
);
