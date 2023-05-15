import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  Color color,
  FontWeight fontWeight,
  TextDecoration? decoration, {
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize * 1.08,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    decoration: decoration,
    height: 1.2,
  );
}

TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  double? fontWeight,
  required Color color,
  TextDecoration? decoration,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.medium,
    decoration,
  );
}

TextStyle getBoldStyle({
  double fontSize = FontSize.s18,
  TextDecoration? decoration,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.bold,
    decoration,
  );
}

TextStyle getSemiBoldItalicStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration? decoration,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.semiBold,
    fontStyle: FontStyle.italic,
    decoration,
  );
}

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration? decoration,
}) {
  return _getTextStyle(fontSize, color, FontWeightManager.semiBold, decoration);
}

TextStyle getLightStyle({
  double fontSize = FontSize.s16,
  double? fontWeight,
  required Color color,
  TextDecoration? decoration,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.light,
    decoration,
  );
}
