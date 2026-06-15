import 'package:sqflite/sqflite.dart';
import 'package:fresh_food_tracker/core/database/database_tables.dart';

class DatabaseSeed {
  DatabaseSeed._();

  static const List<Map<String, dynamic>> defaultFoods = [
    {'name': 'apple', 'image_key': 'apple', 'is_default': 1},
    {'name': 'banana', 'image_key': 'banana', 'is_default': 1},
    {'name': 'milk', 'image_key': 'milk', 'is_default': 1},
    {'name': 'cheese', 'image_key': 'cheese', 'is_default': 1},
    {'name': 'egg', 'image_key': 'egg', 'is_default': 1},
    {'name': 'honey', 'image_key': 'honey', 'is_default': 1},
    {'name': 'watermelon', 'image_key': 'watermelon', 'is_default': 1},
    {'name': 'bread', 'image_key': 'bread', 'is_default': 1},
  ];

  static Future<void> seedDefaultFoods(Database db) async {
    final existing = await db.query(
      DatabaseTables.foods,
      where: 'is_default = 1',
    );
    if (existing.isEmpty) {
      for (final food in defaultFoods) {
        await db.insert(DatabaseTables.foods, food);
      }
    }
  }

  static Future<void> seedFridgeSlots(Database db) async {
    final existing = await db.query(DatabaseTables.fridgeSlots);
    if (existing.isEmpty) {
      for (int i = 0; i < 6; i++) {
        await db.insert(DatabaseTables.fridgeSlots, {
          'slot_index': i,
          'food_id': null,
          'expiry_date': null,
          'added_date': null,
        });
      }
    }
  }
}
