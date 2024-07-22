import 'package:e_medicine/core/common/app_bar_common.dart';
import 'package:e_medicine/core/common/floating_action_button_common.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        context: context,
        title: TextUtils.home,
      ),
      floatingActionButton: const FloatingActionButtonCommon(),
    );
  }
}
