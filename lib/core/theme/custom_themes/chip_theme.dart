import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: const Color(0xFFE8F5E9),
    selectedColor: const Color(0xFF4CAF50),
    disabledColor: const Color(0xFFE0E0E0),
    labelStyle: const TextStyle(
      color: Color(0xFF1E1E1E),
      fontWeight: FontWeight.w500,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: const Color(0xFF263238),
    selectedColor: const Color(0xFF81C784),
    disabledColor: const Color(0xFF424242),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}
