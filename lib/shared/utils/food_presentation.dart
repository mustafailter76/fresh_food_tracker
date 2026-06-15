import 'package:flutter/material.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';

class FoodPresentation {
  FoodPresentation._();

  static IconData icon(String imageKey) {
    switch (imageKey) {
      case 'apple':
        return Icons.apple_rounded;
      case 'banana':
        return Icons.eco_rounded;
      case 'milk':
        return Icons.local_drink_rounded;
      case 'cheese':
        return Icons.breakfast_dining_rounded;
      case 'egg':
        return Icons.egg_alt_rounded;
      case 'honey':
        return Icons.hive_rounded;
      case 'watermelon':
        return Icons.local_pizza_rounded;
      case 'bread':
        return Icons.bakery_dining_rounded;
      default:
        return Icons.restaurant_rounded;
    }
  }

  static String name(AppLocalizations l10n, String key) {
    switch (key) {
      case 'apple':
        return l10n.apple;
      case 'banana':
        return l10n.banana;
      case 'milk':
        return l10n.milk;
      case 'cheese':
        return l10n.cheese;
      case 'egg':
        return l10n.egg;
      case 'honey':
        return l10n.honey;
      case 'watermelon':
        return l10n.watermelon;
      case 'bread':
        return l10n.bread;
      default:
        return key;
    }
  }
}
