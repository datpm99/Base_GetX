import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const.dart';

class Styles {
  /// TextStyles.
  static TextStyle copyStyles({
    Color color = Colors.black,
    double size = 14.0,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      );

  static TextStyle normalText({Color color = Colors.black}) =>
      copyStyles(color: color);

  static TextStyle normalTextBold({Color color = Colors.black}) =>
      copyStyles(color: color, fontWeight: FontWeight.bold);

  static TextStyle smallText({Color color = Colors.black}) =>
      copyStyles(color: color, size: 12);

  static TextStyle smallTextBold({Color color = Colors.black}) =>
      copyStyles(color: color, size: 12, fontWeight: FontWeight.bold);

  static TextStyle mediumText({Color color = Colors.black}) =>
      copyStyles(color: color, size: 16);

  static TextStyle mediumTextBold({Color color = Colors.black}) =>
      copyStyles(color: color, size: 16, fontWeight: FontWeight.bold);

  static TextStyle bigText({Color color = Colors.black}) =>
      copyStyles(color: color, size: 18);

  static TextStyle bigTextBold({Color color = Colors.black}) =>
      copyStyles(color: color, size: 18, fontWeight: FontWeight.bold);

  static TextStyle cusTextBold(
          {Color color = Colors.black, double size = 14}) =>
      copyStyles(color: color, size: size, fontWeight: FontWeight.bold);

  /// Colors.
  static const primaryColor = Color(0xff54C5EB);

  /// Colors Grey.
  static const grey1 = Color(0xFFE0E0E0);
  static const grey2 = Color(0xFFD6D6D6);
  static const grey3 = Color(0xFFBDBDBD);

  /// Themes.
  static ThemeData get light => lightTheme;

  static ThemeData get dark => darkTheme;

  /// Change theme.
  static changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
