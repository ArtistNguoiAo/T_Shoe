import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MenuType {
  HOME,
  LIST,
}

class FloatingActionButtonCommon extends StatefulWidget {
  const FloatingActionButtonCommon({super.key});

  @override
  State<FloatingActionButtonCommon> createState() => _FloatingActionButtonCommonState();
}

class _FloatingActionButtonCommonState extends State<FloatingActionButtonCommon> {
  late bool _isExpanded;
  late double _rotationAngle;
  late MenuType _chooseName;

  @override
  void initState() {
    _isExpanded = false;
    _rotationAngle = 0;
    _chooseName = MenuType.HOME;
    super.initState();
  }

  void _rotateButton() {
    setState(() {
      if(_isExpanded == false) {
        _rotationAngle += 45;
        _isExpanded = true;
      }
      else {
        _rotationAngle -= 45;
        _isExpanded = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: AnimatedOpacity(
            opacity: _isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: _isExpanded,
                  child: InkWell(
                    splashColor: ColorUtils.transparent,
                    highlightColor: ColorUtils.transparent,
                    onTap: () {
                      setState(() {
                        _chooseName = MenuType.LIST;
                      });
                    },
                    child: FaIcon(
                      FontAwesomeIcons.list,
                      color: _chooseName == MenuType.LIST ? ColorUtils.primaryColor : ColorUtils.primaryColorWithOpa30,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: _isExpanded,
                  child: InkWell(
                    splashColor: ColorUtils.transparent,
                    highlightColor: ColorUtils.transparent,
                    onTap: () {
                      setState(() {
                        _chooseName = MenuType.HOME;
                      });
                    },
                    child: FaIcon(
                      FontAwesomeIcons.house,
                      color: _chooseName == MenuType.HOME ? ColorUtils.primaryColor : ColorUtils.primaryColorWithOpa30,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        InkWell(
          splashColor: ColorUtils.transparent,
          highlightColor: ColorUtils.transparent,
          onTap: _rotateButton,
          child: AnimatedRotation(
            turns: _rotationAngle / 360,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: ColorUtils.primaryColor, // Replace with ColorUtils.primaryColor
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
