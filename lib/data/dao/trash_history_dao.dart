import 'package:fresh_food_tracker/core/database/app_database.dart';
import 'package:fresh_food_tracker/core/database/database_tables.dart';
import 'package:fresh_food_tracker/data/model/trash_history_model.dart';

class TrashHistoryDao {
  TrashHistoryDao(this._database);

  final AppDatabase _database;

  Future<List<TrashHistoryModel>> getAll() async {
    final db = await _database.database;
    final maps = await db.query(
      DatabaseTables.trashHistory,
      orderBy: 'trashed_date DESC',
    );

    return maps.map(TrashHistoryModel.fromMap).toList();
  }

  Future<int> insert(TrashHistoryModel history) async {
    final db = await _database.database;
    return db.insert(DatabaseTables.trashHistory, history.toMap());
  }

  Future<int> clear() async {
    final db = await _database.database;
    return db.delete(DatabaseTables.trashHistory);
  }
}
