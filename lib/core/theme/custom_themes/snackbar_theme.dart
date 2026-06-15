import 'package:flutter/material.dart';

class AppSnackBarTheme {
  AppSnackBarTheme._();

  static SnackBarThemeData lightSnackBarTheme = SnackBarThemeData(
    backgroundColor: const Color(0xFF1E1E1E),
    contentTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    elevation: 4,
  );

  static SnackBarThemeData darkSnackBarTheme = SnackBarThemeData(
    backgroundColor: Colors.white,
    contentTextStyle: const TextStyle(
      color: Color(0xFF1E1E1E),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    elevation: 4,
  );
}
