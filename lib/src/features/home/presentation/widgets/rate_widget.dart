import 'package:currency_converter_app/src/features/home/data/models/rate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../../../core/utils/values_manager.dart';

class RateWidget extends StatefulWidget {
  final Rate rate;
  final String country;
  const RateWidget({
    Key? key,
    required this.rate,
    required this.country,
  }) : super(key: key);

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  late bool isToday;
  late String formattedDate;
  late String rate;
  late String currency;

  void init() async {
    currency = widget.rate.currency;
    rate = widget.rate.rate.toString();

    if (widget.rate.date == null) return;

    isToday = widget.rate.date?.difference(DateTime.now()).inDays == 0;
    formattedDate = isToday
        ? DateFormat.jm().format(widget.rate.date!)
        : DateFormat.yMd().format(widget.rate.date!);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RateWidget oldWidget) {
    init();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: ColorManager.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p10, vertical: AppPadding.p10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    currency,
                    style: getBoldStyle(
                      fontSize: FontSize.s14,
                      color: ColorManager.secondary5Color,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  ImageAssets.rightArrow,
                ),
                Text(
                  rate,
                  style: TextStyle(
                    fontSize: FontSize.s12,
                    color: ColorManager.secondary4Color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: AppSize.s8),
            Text(
              widget.country,
              style: getMediumStyle(
                fontSize: FontSize.s12,
                color: ColorManager.secondary4Color,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
