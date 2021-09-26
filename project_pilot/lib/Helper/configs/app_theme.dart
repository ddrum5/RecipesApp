import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/Helper/configs/app_color.dart';

class AppTheme with ChangeNotifier {
  bool _isDart = false;

  ThemeMode get isDart => _isDart ? ThemeMode.light : ThemeMode.dark;

  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "robotoMedium",
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.purplishBlue,
    ),
    backgroundColor: Colors.white,
  );


}
