import 'package:e_medicine/core/common/app_bar_common.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:flutter/material.dart';

class ShoeDetailScreen extends StatefulWidget {
  const ShoeDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<ShoeDetailScreen> createState() => _ShoeDetailScreenState();
}

class _ShoeDetailScreenState extends State<ShoeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        context: context,
        title: TextUtils.detail,
        onTapBack: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Text(widget.id),
      ),
    );
  }
}
