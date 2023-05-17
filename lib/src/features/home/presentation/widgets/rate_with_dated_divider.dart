import 'package:country_provider2/country_provider2.dart';
import 'package:currency_converter_app/src/features/home/data/models/rate.dart';
import 'package:currency_converter_app/src/features/home/presentation/widgets/rate_widget.dart';
import 'package:flutter/material.dart';

import 'dated_divider.dart';

class RateWithDatedDivider extends StatelessWidget {
  final String country;
  final Rate item;
  const RateWithDatedDivider({Key? key,required this.country,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatedDivider(
          date: item.date,
        ),
        RateWidget(
          rate: item,
          country: country,
        )
      ],
    );
  }
}
