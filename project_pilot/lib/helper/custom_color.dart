import 'dart:ui';

class CustomColor {
  static final Color purplishBlue = Color(0xFF651fff);
  static final Color blueLight = Color(0xFF854eff);
  static final Color blueSuperLight = Color(0xFFe5daff);


  static final Color brightVioletLight = Color(0xFFa255ff);

  static final Color brightViolet = Color(0xFFaa00ff);

  static final Color green = Color(0xFF00c853);
  static final Color gray = Color(0xff9e9e9e);
  static final Color grayDark = Color(0xff6d6d6d);
  static final Color grayLite = Color(0xFFdfdfdf);
  static final Color red = Color(0xfff44336);
  static final Color orange = Color(0xffff8f00);

  static Color isDisableColor(bool value) {
    return value ? green : gray;
  }
}
