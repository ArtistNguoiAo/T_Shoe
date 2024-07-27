import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/media_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarCommon extends AppBar {
  AppBarCommon({
    super.key,
    String? title,
    Function()? onTapBack,
    required BuildContext context,
  }) : super(
    title: Text(
      title ?? '',
      style: TextStyleUtils.textStyleMuseoS20W600White,
    ),
    actions: [
      InkWell(
        splashColor: ColorUtils.transparent,
        highlightColor: ColorUtils.transparent,
        child: Container(
          margin: const EdgeInsets.only(right: 12),
          child: const FaIcon(
            FontAwesomeIcons.userLarge,
            color: ColorUtils.white,
          ),
        ),
        onTap: () {

        },
      ),
    ],
    leading: InkWell(
      splashColor: ColorUtils.transparent,
      highlightColor: ColorUtils.transparent,
      onTap: onTapBack,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
            MediaUtils.imgLogoWhite
        ),
      )
    ),
    backgroundColor: ColorUtils.primaryColor,
  );
}