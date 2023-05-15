import 'package:flutter/material.dart';
import 'package:email_app/src/core/utils/assets_manager.dart';
import 'package:email_app/src/core/utils/color_manager.dart';
import 'package:email_app/src/core/utils/strings_manager.dart';
import 'package:email_app/src/core/utils/styles_manager.dart';
import 'package:sizer/sizer.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black100Color.withOpacity(.8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            width: 100.w,
          ),
          Image.asset(ImageAssets.error, width: 180, height: 180),
          SizedBox(
            height: 5.h,
          ),
          Text(
            AppStrings.error,
            style: getBoldStyle(color: ColorManager.grey100),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
