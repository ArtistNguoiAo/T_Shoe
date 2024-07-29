import 'package:e_medicine/core/common/app_bar_common.dart';
import 'package:e_medicine/core/common/text_field_common.dart';
import 'package:e_medicine/core/helper/text_helper.dart';
import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:e_medicine/presentation/screen/shoe_create_screen/cubit/shoe_create_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShoeCreateScreen extends StatefulWidget {
  const ShoeCreateScreen({super.key});

  @override
  State<ShoeCreateScreen> createState() => _ShoeCreateScreenState();
}

class _ShoeCreateScreenState extends State<ShoeCreateScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    _dateController.text = TextHelper.formatDateToString(DateTime.now());
    _noteController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoeCreateCubit()..init(0),
      child: Scaffold(
        appBar: AppBarCommon(
          context: context,
          title: TextUtils.add,
          onTapBack: () {
            Navigator.pop(context);
          },
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(context) {
    return BlocConsumer<ShoeCreateCubit, ShoeCreateState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if (state is ShoeCreateLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ShoeCreateLoaded) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _chooseDate(context),
                _sizeBoxHeight(16),
                _featureRow(context, state.listLength),
                _sizeBoxHeight(16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: const {
                        0: FractionColumnWidth(0.37),
                        1: FractionColumnWidth(0.26),
                        2: FractionColumnWidth(0.37),
                      },
                      children: [
                        // Header row
                        TableRow(
                          children: [
                            _headerTable(TextUtils.type),
                            _headerTable(TextUtils.quantityByPair),
                            _headerTable(TextUtils.priceByPair),
                          ],
                        ),
                        // Data rows
                        for (int index = 0; index < state.listLength; index++)
                          TableRow(
                            children: [
                              _dataTable(false),
                              _dataTable(true),
                              _dataTable(true),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                _sizeBoxHeight(16),
                _note(),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _chooseDate(BuildContext context) {
    return TextFieldCommon(
      readOnly: true,
      fillColor: ColorUtils.white,
      labelText: TextUtils.chooseDate,
      suffixIcon: const Icon(
        FontAwesomeIcons.calendarDay,
        color: ColorUtils.primaryColor,
      ),
      controller: _dateController,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        ).then(
              (date) {
            if (date != null) {
              _dateController.text = date.toString();
            }
          },
        );
      }
    );
  }

  Widget _sizeBoxHeight(double height) {
    return SizedBox(height: height);
  }

  Widget _sizeBoxWidth(double width) {
    return SizedBox(width: width);
  }

  Widget _featureRow(BuildContext context, int listLength) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            splashColor: ColorUtils.transparent,
            highlightColor: ColorUtils.transparent,
            onTap: () {
              context.read<ShoeCreateCubit>().init(listLength + 1);
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: ColorUtils.primaryColor,
                  ),
                ),
                child: Text(
                  TextUtils.addRow,
                  style: TextStyleUtils.textStyleMuseoS16W400Primary,
                  textAlign: TextAlign.center,
                )
            ),
          ),
        ),
        _sizeBoxWidth(16),
        Expanded(
          child: InkWell(
            splashColor: ColorUtils.transparent,
            highlightColor: ColorUtils.transparent,
            onTap: () {
              context.read<ShoeCreateCubit>().init(listLength - 1);
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: ColorUtils.primaryColor,
                  ),
                ),
                child: Text(
                  TextUtils.deleteRow,
                  style: TextStyleUtils.textStyleMuseoS16W400Primary,
                  textAlign: TextAlign.center,
                )
            ),
          ),
        ),
      ],
    );
  }

  Widget _headerTable(String title) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyleUtils.textStyleMuseoS18W600Black,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _dataTable(bool checkKeyboard) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        //color: ColorUtils.white,
        child: TextFieldCommon(
          style: TextStyleUtils.textStyleMuseoS16W400Black,
          textAlign: TextAlign.center,
          keyboardType: checkKeyboard == true
              ? TextInputType.number
              : TextInputType.text,
          maxLines: null,
          fillColor: ColorUtils.white,
        ),
      ),
    );
  }

  Widget _note() {
    return TextFieldCommon(
      controller: _noteController,
      labelText: TextUtils.note,
      maxLines: 5,
      fillColor: ColorUtils.white,
    );
  }
}
