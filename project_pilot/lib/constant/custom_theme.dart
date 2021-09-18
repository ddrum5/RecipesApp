import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product/constant/custom_color.dart';

class CustomTheme with ChangeNotifier {
  bool _isDart = false;

  ThemeMode get isDart => _isDart ? ThemeMode.light : ThemeMode.dark;

  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "robotoMedium",
    appBarTheme: AppBarTheme(
      backgroundColor: CustomColor.purplishBlue,
    ),
    backgroundColor: Colors.white,
  );


}
