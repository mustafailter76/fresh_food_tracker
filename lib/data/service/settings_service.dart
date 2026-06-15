import 'package:fresh_food_tracker/core/database/app_database.dart';

class SettingsService {
  SettingsService(this._database);

  final AppDatabase _database;

  Future<void> resetDatabase() {
    return _database.resetDatabase();
  }
}
