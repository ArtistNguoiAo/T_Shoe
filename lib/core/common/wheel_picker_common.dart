import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:flutter/cupertino.dart';

class WheelPickerCommon extends CupertinoPicker {
  WheelPickerCommon({
    super.key,
    required List<String> data,
    required Function(int) onSelectedItemChanged,
  }) : super(
    itemExtent: 40,
    //looping: true,
    onSelectedItemChanged: onSelectedItemChanged,
    selectionOverlay: Container(
      decoration: BoxDecoration(
        color: ColorUtils.blueWithOpa12,
        border: const Border(
          top: BorderSide(color: ColorUtils.blue),
          bottom: BorderSide(color: ColorUtils.blue),
        ),
      ),
    ),
    children: data.map((item) =>
        Center(
          child: Text(
            item,
            style: TextStyleUtils.textStyleMuseoS16W400Black,
            overflow: TextOverflow.ellipsis,
          ),
        ),
    ).toList(),
    backgroundColor: ColorUtils.white,
  );
}