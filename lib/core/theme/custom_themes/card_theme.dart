import 'package:flutter/material.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardThemeData lightCardTheme = CardThemeData(
    color: Colors.white,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    margin: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(color: Color(0xFFEAEAEA)),
    ),
  );

  static CardThemeData darkCardTheme = CardThemeData(
    color: const Color(0xFF1E1E1E),
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    margin: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(color: Color(0xFF333333)),
    ),
  );
}
