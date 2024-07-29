import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';


class TextFieldCommon extends TextField {
  TextFieldCommon({
    super.key,
    super.controller,
    super.style,
    super.minLines,
    super.maxLines,
    super.maxLength,
    super.obscureText,
    super.textAlign,
    String? hintText,
    String? labelText,
    TextStyle? hintStyle,
    int? hintMaxLines,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
    InputBorder? border,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? enabledBorder,
    InputBorder? disabledBorder,
    Color? fillColor,
    TextInputType? keyboardType,
    super.readOnly,
    super.onTap,
  }) : super(
    keyboardType: keyboardType ?? TextInputType.text,

    decoration: InputDecoration(
      border: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: ColorUtils.greyCE)),
      focusedBorder: focusedBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: ColorUtils.primaryColor)),
      errorBorder: errorBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: ColorUtils.greyCE)),
      enabledBorder: enabledBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: ColorUtils.greyCE)),
      disabledBorder: disabledBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: ColorUtils.greyCE)),
      hintText: hintText ?? '',
      labelText: labelText ?? '',
      labelStyle: TextStyleUtils.textStyleMuseoS18W500Black,
      hintStyle: hintStyle ?? TextStyleUtils.textStyleMuseoS18W500GreyCE,
      hintMaxLines: hintMaxLines,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: contentPadding,
      fillColor: fillColor,
      filled: fillColor != null,
      counter: const Offstage(),
    ),
  );
}