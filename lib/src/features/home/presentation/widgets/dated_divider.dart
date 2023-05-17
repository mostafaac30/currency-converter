import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/styles_manager.dart';

class DatedDivider extends StatelessWidget {
  final DateTime? date;
  final formatter = DateFormat('yyyy-MM-dd');

  DatedDivider({Key? key, required this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: Divider(
        color: ColorManager.secondary3Color,
      )),
      if (date != null)
        Text(
          formatter.format(date!),
          style: getMediumStyle(
            color: ColorManager.secondaryColor,
            fontSize: FontSize.s16,
          ),
        ),
      Expanded(
          child: Divider(
        color: ColorManager.secondary3Color,
      )),
    ]);
  }
}
