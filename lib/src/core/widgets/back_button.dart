import 'package:flutter/material.dart';
import 'package:email_app/src/core/widgets/custom_click.dart';

import '../utils/assets_manager.dart';
import '../utils/values_manager.dart';

class CustomBackButton extends StatelessWidget {
  // Future<void> Function()? onTap;
  const CustomBackButton({
    // this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomClick(
      onTap: () {
        Navigator.pop(
          context,
        );
        // if (onTap != null) {
        //   await onTap!();
        // }
      },
      child: Image.asset(
        ImageAssets.back,
        width: AppSize.w9_6,
      ),
    );
  }
}
