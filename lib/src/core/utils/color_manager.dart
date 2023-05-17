import 'package:flutter/material.dart';

class ColorManager {
  static Color bgColor = Colors.white;

  static Color primaryColor = const Color(0xFFffffff); //bg color
  static Color secondaryColor = const Color(0xFF18ce92); //btn color
  static const Color secondary2Color = Color(0xFFf5f5f5); //text bg color
  static Color secondary3Color = const Color(0xFF252525); //font color
  static Color secondary4Color = const Color(0xFF9e9e9e); //sec font color
  static Color secondary5Color = const Color(0xFF212121); //font color
}

extension HexColor on Color {
  static Color fromHex(String hexCode) {
    final buffer = StringBuffer();
    if (hexCode.length == 6 || hexCode.length == 7) buffer.write('FF');
    buffer.write(hexCode.replaceFirst('#', ''));
    return Color(
      int.parse(buffer.toString(), radix: 16),
    );
  }
}
