import 'package:email_app/src/core/utils/color_manager.dart';
import 'package:email_app/src/core/utils/styles_manager.dart';
import 'package:email_app/src/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final IconData iconData;
  final void Function()? onPressed;

  const CustomButton({
    Key? key,
    required this.buttonName,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(color: Colors.grey.shade300),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16)),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
              vertical: AppPadding.p10, horizontal: AppPadding.p10),
        ),
        overlayColor: MaterialStateProperty.all(
          Colors.grey.withOpacity(0.1),
        ),
        backgroundColor: MaterialStateProperty.all(
          ColorManager.secondaryColor,
        ),
        maximumSize: MaterialStateProperty.all(
          const Size(AppSize.s150, AppSize.s50),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: ColorManager.primaryColor,
          ),
          const SizedBox(
            width: AppSize.s6,
          ),
          FittedBox(
            child: Text(
              buttonName,
              style: getMediumStyle(color: ColorManager.primaryColor),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
