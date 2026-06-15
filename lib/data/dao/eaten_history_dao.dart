import 'package:fresh_food_tracker/core/database/app_database.dart';
import 'package:fresh_food_tracker/core/database/database_tables.dart';
import 'package:fresh_food_tracker/data/model/eaten_history_model.dart';

class EatenHistoryDao {
  EatenHistoryDao(this._database);

  final AppDatabase _database;

  Future<List<EatenHistoryModel>> getAll() async {
    final db = await _database.database;
    final maps = await db.query(
      DatabaseTables.eatenHistory,
      orderBy: 'eaten_date DESC',
    );

    return maps.map(EatenHistoryModel.fromMap).toList();
  }

  Future<int> insert(EatenHistoryModel history) async {
    final db = await _database.database;
    return db.insert(DatabaseTables.eatenHistory, history.toMap());
  }

  Future<int> clear() async {
    final db = await _database.database;
    return db.delete(DatabaseTables.eatenHistory);
  }
}
