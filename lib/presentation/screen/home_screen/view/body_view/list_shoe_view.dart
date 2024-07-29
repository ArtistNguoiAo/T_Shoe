import 'package:e_medicine/core/common/wheel_picker_common.dart';
import 'package:e_medicine/core/route/app_route.dart';
import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:e_medicine/presentation/screen/home_screen/cubit/list_view_cubit/list_view_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ListShoeView extends StatefulWidget {
  const ListShoeView({super.key});

  @override
  State<ListShoeView> createState() => _ListShoeViewState();
}

class _ListShoeViewState extends State<ListShoeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListViewCubit, ListViewState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state is ListViewLoaded) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _addShoe(),
                _sizeBoxHeight(16),
                _chooseMonthAndYear(state),
                _sizeBoxHeight(16),
                _filterShoe(),
                _deviceSizeBoxHeight(16),
                _sizeBoxHeight(16),
                _listViewShoe(),
              ]
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _addShoe() {
    return InkWell(
      splashColor: ColorUtils.transparent,
      highlightColor: ColorUtils.transparent,
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.shoeCreate);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: ColorUtils.primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            "<< ${TextUtils.add} >>",
            style: TextStyleUtils.textStyleMuseoS16W400White,
          ),
        ),
      ),
    );
  }

  Widget _chooseMonthAndYear(ListViewLoaded state) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        //color: ColorUtils.primaryColorWithOpa30,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FaIcon(
                  FontAwesomeIcons.calendarDay,
                  color: ColorUtils.blue,
                ),
                _sizeBoxHeight(8),
                SizedBox(
                  height: 80,
                  child: WheelPickerCommon(
                    data: state.listMonth,
                    onSelectedItemChanged: (index) {
                      setState(() {

                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          _sizeBoxWidth(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FaIcon(
                  FontAwesomeIcons.calendarDay,
                  color: ColorUtils.blue,
                ),
                _sizeBoxHeight(8),
                SizedBox(
                  height: 80,
                  child: WheelPickerCommon(
                    data: state.listYear,
                    onSelectedItemChanged: (index) {
                      setState(() {

                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sizeBoxHeight(double height) {
    return SizedBox(height: height);
  }

  Widget _sizeBoxWidth(double width) {
    return SizedBox(width: width);
  }

  Widget _filterShoe() {
    return Row(
      children: [
        Text(
          TextUtils.list,
          style: TextStyleUtils.textStyleMuseoS18W600Black,
        ),
      ],
    );
  }

  Widget _deviceSizeBoxHeight(double height) {
    return Container(
      height: 1,
      color: ColorUtils.greyCE,
      width: MediaQuery.of(context).size.width - 16,
    );
  }

  Widget _listViewShoe() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.shoeDetail, arguments: '${index + 1}');
            },
            onLongPress: () {

            },
            splashColor: ColorUtils.transparent,
            highlightColor: ColorUtils.transparent,
            child: Stack(
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width - 16,
                  padding: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: ColorUtils.blue,
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.calculator,
                              color: ColorUtils.blue,
                              size: 20,
                            ),
                            _sizeBoxWidth(8),
                            Text(
                              '150 <đôi>',
                              style: TextStyleUtils.textStyleMuseoS16W400Black,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.dongSign,
                              color: ColorUtils.blue,
                              size: 20,
                            ),
                            _sizeBoxWidth(8),
                            Text(
                              '500.000',
                              style: TextStyleUtils.textStyleMuseoS16W400Black,
                            ),
                          ],
                        )
                      ]
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                      height: 40,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: ColorUtils.blue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '01 - 02 - 2022',
                          style: TextStyleUtils.textStyleMuseoS16W400White,
                        ),
                      )
                  ),
                ),
              ]
            ),
          );
        },
        separatorBuilder: (context, index) => _sizeBoxHeight(16),
        itemCount: 20,
      ),
    );
  }
}
