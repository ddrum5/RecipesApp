/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';

class AppTheme with ChangeNotifier {
  bool _isDart = false;

  ThemeMode get isDart => _isDart ? ThemeMode.light : ThemeMode.dark;

  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "robotoMedium",
    appBarTheme: AppBarTheme(
      backgroundColor: CustomColors.purplishBlue,
    ),
    backgroundColor: Colors.white,
  );
}
*/
import 'package:flutter/material.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: CustomColors.purplishBlue,
    fontFamily: 'robotoRegular',
    shadowColor: CustomColors.shadowLight,
    appBarTheme: AppBarTheme(color: CustomColors.purplishBlue),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: 'robotoMedium',
      ),
      bodyText1: TextStyle(
        color: Color(0xFF9D9D9D),
        fontSize: 14,
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    backgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    fontFamily: 'robotoRegular',
    shadowColor: CustomColors.shadowDark,
    appBarTheme: AppBarTheme(color: CustomColors.appBarDark),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily: 'robotoMedium',
      ),
      bodyText1: TextStyle(
        color: Color(0xFF9D9D9D),
        fontSize: 14,
      ),
    ),
  );
}
