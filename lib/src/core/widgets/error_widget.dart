import 'package:flutter/material.dart';
import 'package:currency_converter_app/src/core/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: ColorManager.secondary3Color,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text(
            'something_went_wrong',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          'try_again',
          style: TextStyle(
              color: ColorManager.secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        Container(
          height: 55,
          width: 55.w,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text(
              'reload_screen',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        )
      ],
    );
  }
}
