import 'package:e_medicine/core/common/app_bar_common.dart';
import 'package:e_medicine/core/helper/text_helper.dart';
import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShoeDetailScreen extends StatefulWidget {
  const ShoeDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<ShoeDetailScreen> createState() => _ShoeDetailScreenState();
}

class _ShoeDetailScreenState extends State<ShoeDetailScreen> {
  final List<Map<String, dynamic>> items = [
    {"loai": "Giày thể thao", "soLuong": 100000, "giaTien": 5000000000},
    {"loai": "Giày cao gót", "soLuong": 5, "giaTien": 750000},
    {"loai": "Giày lười", "soLuong": 8, "giaTien": 300000},
    {"loai": "Giày lười da", "soLuong": 18, "giaTien": 300000},
  ];

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
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Ngày 01 - 01 - 2024',
                  style: TextStyleUtils.textStyleMuseoS18W500Black,
                ),
              ),
              InkWell(
                splashColor: ColorUtils.transparent,
                highlightColor: ColorUtils.transparent,
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: ColorUtils.primaryColor,
                    ),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.pencil,
                    color: ColorUtils.primaryColor,
                  ),
                ),
              )
            ],
          ),
          _sizeBoxHeight(16),
          Expanded(
            child: SingleChildScrollView(
              child: Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FractionColumnWidth(0.38),
                  1: FractionColumnWidth(0.24),
                  2: FractionColumnWidth(0.38),
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
                  for (var item in items)
                    TableRow(
                      children: [
                        _dataTable(item['loai'].toString(), false),
                        _dataTable(TextHelper.formatNumberByThousands(item['soLuong']), false),
                        _dataTable(TextHelper.formatNumberByThousands(item['giaTien']), false),
                      ],
                    ),
                  // Data total
                  TableRow(
                    children: [
                      _dataTable(TextUtils.total, true),
                      _dataTable(TextHelper.formatNumberByThousands(items.map((e) => e['soLuong']).reduce((value, element) => value + element)), true),
                      _dataTable(TextHelper.formatNumberByThousands(items.map((e) => e['giaTien']).reduce((value, element) => value + element)), true),
                    ],
                  ),
                ],
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

  Widget _headerTable(String title) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyleUtils.textStyleMuseoS18W800Black,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _dataTable(String data, bool checkTotal) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: checkTotal == false ? null : ColorUtils.primaryColorWithOpa30,
        child: Text(
          data,
          style: TextStyleUtils.textStyleMuseoS16W400Black,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
