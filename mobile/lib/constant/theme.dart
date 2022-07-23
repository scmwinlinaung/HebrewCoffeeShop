// Flutter: Existing Libraries
import 'package:flutter/material.dart';

class ThemeConstant {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xffcc9966),
    indicatorColor: const Color(0xff5e87d4),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w600,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w600,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w300,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w300,
        decoration: TextDecoration.underline,
      ),
      button: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w300,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.normal,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xff86a5df),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    primaryColor: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.lightBlue.shade200,
      opacity: 0.8,
    ),
    colorScheme: const ColorScheme.dark(),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w600,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w600,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w300,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w300,
        decoration: TextDecoration.underline,
      ),
      button: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.w300,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: "Pyidaungsu",
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
