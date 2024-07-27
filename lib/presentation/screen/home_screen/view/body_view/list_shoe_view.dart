import 'package:e_medicine/core/common/wheel_picker_common.dart';
import 'package:e_medicine/core/route/app_route.dart';
import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:e_medicine/presentation/screen/home_screen/cubit/list_view_cubit/list_view_cubit.dart';
import 'package:flutter/material.dart';
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
                _chooseMonthAndYear(state),
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

  Widget _chooseMonthAndYear(ListViewLoaded state) {
    return Card(
      elevation: 4,
      color: ColorUtils.white,
      shadowColor: ColorUtils.black,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              margin: const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
              child: WheelPickerCommon(
                data: state.listMonth,
                onSelectedItemChanged: (index) {
                  setState(() {

                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 80,
              margin: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
              child: WheelPickerCommon(
                data: state.listYear,
                onSelectedItemChanged: (index) {
                  setState(() {

                  });
                },
              ),
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
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width/2 - 16,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: ColorUtils.blueWithOpa12,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
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
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: ColorUtils.blueWithOpa12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                    height: 40,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: ColorUtils.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '01 - 02 - 2022',
                        style: TextStyleUtils.textStyleMuseoS16W400White,
                      ),
                    )
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
