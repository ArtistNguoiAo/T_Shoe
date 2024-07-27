import 'package:flutter/material.dart';

class ColorUtils {
  static const Color primaryColor = Color(0xffF05323);

  static const Color transparent = Colors.transparent;

  static const Color greyCE = Color(0xffCECECE);

  static const Color black = Color(0xff000000);

  static const Color white = Color(0xffFFFFFF);

  static const Color red = Color(0xffFF0000);

  static const Color blue = Colors.blue;

  static Color primaryColorWithOpa30 = ColorUtils.primaryColor.withOpacity(0.3);

  static Color blueWithOpa12 = ColorUtils.blue.withOpacity(0.12);
}