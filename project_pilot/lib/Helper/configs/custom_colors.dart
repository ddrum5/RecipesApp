import 'dart:ui';

import 'package:flutter/material.dart';

class CustomColors {
  static Color purplishBlue = Color(0xFF651fff);
  static Color blueSuperLight = Color(0xFFede5ff);

  static Color brightVioletLight = Color(0xFFa255ff);

  static Color brightViolet = Color(0xFFaa00ff);

  static final Color green = Color(0xFF00c853);
  static final Color gray = Color(0xff9e9e9e);
  static final Color grayDark = Color(0xff6d6d6d);
  static final Color graySpDark = Color(0xff585858);
  static final Color grayLite = Color(0xFFdfdfdf);
  static final Color red = Color(0xFFf44336);
  static final Color orange = Color(0xffff8f00);

  static Color isDisableColor(bool value) {
    return value ? green : gray;
  }

  static Color selectedLightColor = const Color(0xff1a651fff);
  static Color selectedDarkColor = const Color(0xff1a651fff);
  static Color shadowLight = Colors.black54;
  static Color shadowDark = Colors.white;
  static Color scaffoldDarkBackground = const Color(0xff313c44);
  static Color appBarDark = const Color(0xff151b20);
}
