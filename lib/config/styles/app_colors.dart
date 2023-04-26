import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  static const Color ACCENT_COLOR = Colors.amber;
  static HexColor DARK_GREEN = HexColor('235130');
  static Color? LIGHT_GREEN = Colors.green[900];
  static HexColor WHITE_SMOKE = HexColor('F5F5F5');
  static HexColor BACKGROUND_COLOR = HexColor('f5f6fa');
  static const Color primaryElement = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryElement = Color.fromARGB(255, 0, 0, 0);
  static const Color primaryText = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryText = Color.fromARGB(255, 172, 177, 193);
  static const Color accentText = Color.fromARGB(255, 31, 37, 50);
  static const Color sterihealColor = Colors.cyan;
  static const Color LIGHT_PINK = Colors.pink;
  static const Color WHITE = Colors.white;
  static Color bottomNavigationBarColor = AppColors.colorFromHex('#384247');

  static const Color primaryColor = Color(0xFF023878);

  static Color footerColor() {
    return colorFromHex('#384247');
  }

  static Color appThemeColor() {
    return colorFromHex('#F1AD0A');
  }

  static Color headerColor() {
    return colorFromHex('#384247');
  }

  static Color unSelectedItemColor() {
    return colorFromHex('#A6A6A6');
  }

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
