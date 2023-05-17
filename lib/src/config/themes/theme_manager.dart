import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/utils/font_manager.dart';
import '../../core/utils/styles_manager.dart';
import '../../core/utils/values_manager.dart';

import '../../core/utils/color_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //app colors
    scaffoldBackgroundColor: ColorManager.primaryColor,
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.bgColor,
    primaryColorDark: ColorManager.secondary5Color,
    disabledColor: ColorManager.bgColor,
    splashColor: ColorManager.secondary4Color, //ripple effect
    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.secondaryColor,
      shadowColor: ColorManager.secondary5Color.withOpacity(0.1),
      margin: const EdgeInsets.all(AppMargin.m16),

      elevation: AppSize.s6, // Adjust this to control the shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
        side: const BorderSide(
          color: ColorManager.secondary2Color,
          width: 0.5,
        ),
      ),
    ), // app bar theme
    //appBar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primaryColor,
        elevation: AppSize.s4,
        iconTheme: IconThemeData(
            color: ColorManager.secondaryColor, size: AppSize.s40),
        titleTextStyle: getBoldStyle(
          fontSize: FontSize.s18,
          color: ColorManager.secondaryColor,
        )),
    //button theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.secondary5Color,
      disabledColor: ColorManager.secondary4Color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
    ),
    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getBoldStyle(
          color: ColorManager.secondary5Color,
          fontSize: FontSize.s16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        elevation: AppSize.s0,
      ),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.bgColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p10,
        vertical: AppPadding.p14,
      ),
      hintStyle: getSemiBoldItalicStyle(
        fontSize: FontSize.s14,
        color: ColorManager.secondary4Color,
      ),
      labelStyle: getSemiBoldItalicStyle(
        fontSize: FontSize.s12,
        color: ColorManager.secondary2Color,
      ),
      errorStyle: getSemiBoldItalicStyle(
        fontSize: FontSize.s12,
        color: ColorManager.secondaryColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
        // borderSide: BorderSide(
        //   color: ColorManager.primary1,
        //   width: AppSize.s1_5,
        // ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.secondary2Color,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.secondaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      //when he start typing again after error
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
    ),

    //text theme
    textTheme: TextTheme(
        //for buttons text
        headlineMedium: getBoldStyle(
      color: ColorManager.primaryColor,
    )),

    visualDensity: VisualDensity.adaptivePlatformDensity,
    scrollbarTheme: ScrollbarThemeData(
      thickness: MaterialStateProperty.all(2.0),
      radius: const Radius.circular(5.0),
    ),

    //icon default color
    iconTheme: IconThemeData(
      color: ColorManager.secondaryColor,
      size: AppSize.s24,
    ),
    // indicator default color and CupertinoActivityIndicator
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: ColorManager.secondaryColor,
    ),
    indicatorColor: ColorManager.secondaryColor,
    //  progress indicator
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorManager.secondaryColor,
    ),
  );
}
