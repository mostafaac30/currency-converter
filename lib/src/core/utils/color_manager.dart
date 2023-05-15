import 'package:flutter/material.dart';

class ColorManager {
  static Color bgColor = Colors.white;

  static Color primaryColor = const Color(0xFFffffff); //bg color
  static Color secondaryColor = const Color(0xFF18ce92); //btn color
  static const Color secondary2Color = Color(0xFFf5f5f5); //text bg color
  static Color secondary3Color = const Color(0xFF252525); //font color
  static Color secondary4Color = const Color(0xFF9e9e9e); //sec font color
  static Color secondary5Color = const Color(0xFF212121); //font color

  static Color titleColor = HexColor.fromHex('#000000');
  static Color bgBlockColor = HexColor.fromHex('#FFFFFF');
  static Color black100Color = const Color(0xFF03081A);
  static Color bodyText25Color = HexColor.fromHex('#AEB3C2');
  static Color bodyText60Color = const Color(0xFF666A78);
  static Color border10Color = HexColor.fromHex('#E6E6E8');
  static Color yellowColor = HexColor.fromHex('#FFB800');
  static Color orangeColor = HexColor.fromHex('#FF7A00');
  static Color redColor = HexColor.fromHex('#f75555');
  static Color blueColor = HexColor.fromHex('#0038FF');
  static Color greenColor = HexColor.fromHex('#0EC320');
  static Color primaryLightColor = HexColor.fromHex('#361E70');
  static Color purpleLight = HexColor.fromHex('#705FDD');
  static Color purpleGradientTop = HexColor.fromHex('#8271FF');
  static Color purpleGradientBottom = HexColor.fromHex('#1F1147');
  static Color brightGreen = HexColor.fromHex('#37E9BB');
  static const Color primary3 =
      Color(0xFF6949FD); //HexColor.fromHex('#6949FD');
  static Color secondary1 = HexColor.fromHex('#144438');
  static Color secondary2 = HexColor.fromHex('#269679');
  static Color grey300 = HexColor.fromHex('#A9A5B8');
  static Color grey100 = HexColor.fromHex('#E9E9E9');
  static Color gold = HexColor.fromHex('#FFC700');

  static Color grey700 = HexColor.fromHex('#2A1F49');
  static Color grey900 = HexColor.fromHex('#1D0D4A');
  static Color grey500 = HexColor.fromHex('#4F4862');

  static Color secondary3 = HexColor.fromHex('#37E9BB');
  static Color accent1 = HexColor.fromHex('#4E0929');
  static Color accent2 = HexColor.fromHex('#AB125A');
  static Color accent3 = HexColor.fromHex('#E9177A');
  static Color primary1 = HexColor.fromHex('#1F1147');

  static Color primary2 = HexColor.fromHex('#361E70');
  static Color gradient1Upper = HexColor.fromHex('#FF5F6B');
  static Color gradient1Lower = HexColor.fromHex('#FFA93F');
  static Color gradient2Upper = HexColor.fromHex('#37E9BB');
  static Color gradient2Lower = HexColor.fromHex('#144438');
  static Color gradient3Upper = HexColor.fromHex('#E9177A');
  static Color gradient3Lower = HexColor.fromHex('#4E0929');
  static Color gradient4Upper = HexColor.fromHex('#8271FF');
  static Color gradient4Lower = HexColor.fromHex('#1F1147');

  static Color brown = HexColor.fromHex('#876249');
  static Color lightGreen = HexColor.fromHex('#5D7F89');
  static Color bg2 = HexColor.fromHex('#EDEDF4');
  static Color activeIcon = HexColor.fromHex('#27AE60');
  static Color inactiveIcon = HexColor.fromHex('#C0392B');
  static Color gray600 = Colors.grey.shade600;
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
