import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/font_utils.dart';
import 'package:flutter/cupertino.dart';


class TextStyleUtils {
  //font
  static const TextStyle textStyleMuseo = TextStyle(fontFamily: FontUtils.museoModerno);

  // size
  static TextStyle textStyleMuseoS16 = textStyleMuseo.copyWith(fontSize: 16);
  static TextStyle textStyleMuseoS18 = textStyleMuseo.copyWith(fontSize: 18);
  static TextStyle textStyleMuseoS20 = textStyleMuseo.copyWith(fontSize: 20);

  // // weight
  static TextStyle textStyleMuseoS16W400 = textStyleMuseoS16.copyWith(fontWeight: FontWeight.w400);
  static TextStyle textStyleMuseoS18W500 = textStyleMuseoS18.copyWith(fontWeight: FontWeight.w500);
  static TextStyle textStyleMuseoS20W600 = textStyleMuseoS20.copyWith(fontWeight: FontWeight.w600);

  // color
  static TextStyle textStyleMuseoS16W400Black = textStyleMuseoS16W400.copyWith(color: ColorUtils.black);
  static TextStyle textStyleMuseoS16W400White = textStyleMuseoS16W400.copyWith(color: ColorUtils.white);
  static TextStyle textStyleMuseoS16W400Primary = textStyleMuseoS16W400.copyWith(color: ColorUtils.primaryColor);
  static TextStyle textStyleMuseoS16W400Red = textStyleMuseoS16W400.copyWith(color: ColorUtils.red);

  static TextStyle textStyleMuseoS18W500Black = textStyleMuseoS18W500.copyWith(color: ColorUtils.black);
  static TextStyle textStyleMuseoS18W500GreyCE = textStyleMuseoS18W500.copyWith(color: ColorUtils.greyCE);
  static TextStyle textStyleMuseoS18W500White = textStyleMuseoS18W500.copyWith(color: ColorUtils.white);

  static TextStyle textStyleMuseoS20W600White = textStyleMuseoS20W600.copyWith(color: ColorUtils.white);
}