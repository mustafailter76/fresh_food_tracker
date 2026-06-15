import 'package:fresh_food_tracker/data/model/fridge_slot_model.dart';
import 'package:fresh_food_tracker/core/database/app_database.dart';
import 'package:fresh_food_tracker/core/database/database_tables.dart';

class FridgeSlotDao {
  FridgeSlotDao(this._database);

  final AppDatabase _database;

  Future<List<FridgeSlotModel>> getAllSlots() async {
    final db = await _database.database;
    final maps = await db.query(
      DatabaseTables.fridgeSlots,
      orderBy: 'slot_index ASC',
    );

    return maps.map(FridgeSlotModel.fromMap).toList();
  }

  Future<FridgeSlotModel?> getSlotByIndex(int slotIndex) async {
    final db = await _database.database;
    final maps = await db.query(
      DatabaseTables.fridgeSlots,
      where: 'slot_index = ?',
      whereArgs: [slotIndex],
      limit: 1,
    );

    if (maps.isEmpty) return null;
    return FridgeSlotModel.fromMap(maps.first);
  }

  Future<void> placeFood({
    required int slotIndex,
    required int foodId,
    required DateTime expiryDate,
  }) async {
    final db = await _database.database;

    await db.update(
      DatabaseTables.fridgeSlots,
      {
        'food_id': foodId,
        'expiry_date': expiryDate.toIso8601String(),
        'added_date': DateTime.now().toIso8601String(),
      },
      where: 'slot_index = ?',
      whereArgs: [slotIndex],
    );
  }

  Future<void> clearSlot(int slotIndex) async {
    final db = await _database.database;

    await db.update(
      DatabaseTables.fridgeSlots,
      {'food_id': null, 'expiry_date': null, 'added_date': null},
      where: 'slot_index = ?',
      whereArgs: [slotIndex],
    );
  }

  Future<void> clearAllSlots() async {
    final db = await _database.database;

    await db.update(DatabaseTables.fridgeSlots, {
      'food_id': null,
      'expiry_date': null,
      'added_date': null,
    });
  }
}
