import 'package:e_medicine/core/common/app_bar_common.dart';
import 'package:e_medicine/core/enum/menu_type.dart';
import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:e_medicine/presentation/screen/home_screen/cubit/home_cubit/home_cubit.dart';
import 'package:e_medicine/presentation/screen/home_screen/cubit/list_view_cubit/list_view_cubit.dart';
import 'package:e_medicine/presentation/screen/home_screen/view/body_view/home_view.dart';
import 'package:e_medicine/presentation/screen/home_screen/view/body_view/list_shoe_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late bool _isExpanded;
  late double _rotationAngle;

  @override
  void initState() {
    _isExpanded = false;
    _rotationAngle = 0;
    super.initState();
  }

  String _chooseTitleAppBar(MenuType menuType) {
    if(menuType == MenuType.HOME) {
      return TextUtils.home;
    }
    else {
      return TextUtils.list;
    }
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..init(MenuType.HOME),
        ),
        BlocProvider(
          create: (context) => ListViewCubit()..init(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if(state is HomeMenuTypeState) {
            return Scaffold(
              appBar: AppBarCommon(
                context: context,
                title: _chooseTitleAppBar(state.menuType),
              ),
              floatingActionButton: Column(
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
                                context.read<HomeCubit>().init(MenuType.LIST);
                              },
                              child: FaIcon(
                                FontAwesomeIcons.list,
                                color: state.menuType == MenuType.LIST ? ColorUtils.primaryColor : ColorUtils.primaryColorWithOpa30,
                                size: 32,
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
                                context.read<HomeCubit>().init(MenuType.HOME);
                              },
                              child: FaIcon(
                                FontAwesomeIcons.house,
                                color: state.menuType == MenuType.HOME ? ColorUtils.primaryColor : ColorUtils.primaryColorWithOpa30,
                                size: 32,
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
              ),
              body: state.menuType == MenuType.HOME
                  ? const HomeView()
                  : const ListShoeView()
            );
          }
          return Container();
        },
      ),
    );
  }
}
