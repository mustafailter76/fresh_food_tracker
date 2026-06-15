import 'package:flutter/material.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/appbar_theme.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/card_theme.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/chip_theme.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/dialog_theme.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/elevated_button_theme.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/snackbar_theme.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/switch_theme.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/text_field_theme.dart';
import 'package:fresh_food_tracker/core/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    primaryColor: const Color(0xFF4CAF50),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4CAF50),
      secondary: Color(0xFFFF9800),
      surface: Colors.white,
      error: Color(0xFFE53935),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF1E1E1E),
      onError: Colors.white,
      secondaryContainer: Color(0xFFFFE0B2),
      errorContainer: Color(0xFFFFCDD2),
    ),
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    snackBarTheme: AppSnackBarTheme.lightSnackBarTheme,
    switchTheme: AppSwitchTheme.lightSwitchTheme,
    dialogTheme: AppDialogTheme.lightDialogTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    cardTheme: AppCardTheme.lightCardTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: const Color(0xFF81C784),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF81C784),
      secondary: Color(0xFFFFB74D),
      surface: Color(0xFF1E1E1E),
      error: Color(0xFFEF5350),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onError: Colors.black,
      secondaryContainer: Color(0xFF3E2A00),
      errorContainer: Color(0xFF4A0000),
    ),
    textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
    snackBarTheme: AppSnackBarTheme.darkSnackBarTheme,
    switchTheme: AppSwitchTheme.darkSwitchTheme,
    dialogTheme: AppDialogTheme.darkDialogTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    cardTheme: AppCardTheme.darkCardTheme,
  );

  static Color expiryFreshColor = Colors.green.shade600;
  static Color expirySoonColor = Colors.orange.shade600;
  static Color expiryExpiredColor = Colors.red.shade700;
}
