import 'package:fresh_food_tracker/core/database/app_database.dart';
import 'package:fresh_food_tracker/core/database/database_tables.dart';
import 'package:fresh_food_tracker/data/model/food_model.dart';

class FoodDao {
  FoodDao(this._database);

  final AppDatabase _database;

  Future<List<FoodModel>> getAllFoods() async {
    final db = await _database.database;
    final maps = await db.query(DatabaseTables.foods, orderBy: 'name ASC');

    return maps.map(FoodModel.fromMap).toList();
  }

  Future<FoodModel?> getFoodById(int id) async {
    final db = await _database.database;
    final maps = await db.query(
      DatabaseTables.foods,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isEmpty) return null;
    return FoodModel.fromMap(maps.first);
  }

  Future<int> insertFood(FoodModel food) async {
    final db = await _database.database;
    return db.insert(DatabaseTables.foods, food.toMap());
  }

  Future<int> deleteCustomFoods() async {
    final db = await _database.database;
    return db.delete(
      DatabaseTables.foods,
      where: 'is_default = ?',
      whereArgs: [0],
    );
  }
}
