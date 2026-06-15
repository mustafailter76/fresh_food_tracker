import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fresh_food_tracker/core/database/database_tables.dart';
import 'package:fresh_food_tracker/core/database/database_seed.dart';

class AppDatabase {
  AppDatabase._internal();
  static final AppDatabase instance = AppDatabase._internal();

  static Database? _database;
  static bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    _database = await _initDatabase();
    _initialized = true;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    _initialized = true;
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fresh_food_tracker.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(DatabaseTables.createFoodsTableIfNotExists);
    await db.execute(DatabaseTables.createFridgeSlotsTableIfNotExists);
    await db.execute(DatabaseTables.createEatenHistoryTableIfNotExists);
    await db.execute(DatabaseTables.createTrashHistoryTableIfNotExists);

    await DatabaseSeed.seedDefaultFoods(db);
    await DatabaseSeed.seedFridgeSlots(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('DROP TABLE IF EXISTS ${DatabaseTables.trashHistory}');
    await db.execute('DROP TABLE IF EXISTS ${DatabaseTables.eatenHistory}');
    await db.execute('DROP TABLE IF EXISTS ${DatabaseTables.fridgeSlots}');
    await db.execute('DROP TABLE IF EXISTS ${DatabaseTables.foods}');

    await _onCreate(db, newVersion);
  }

  Future<void> resetDatabase() async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete(DatabaseTables.eatenHistory);
      await txn.delete(DatabaseTables.trashHistory);
      await txn.update(DatabaseTables.fridgeSlots, {
        'food_id': null,
        'expiry_date': null,
        'added_date': null,
      });
      await txn.delete(DatabaseTables.foods, where: 'is_default = 0');
    });
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
    _initialized = false;
  }
}
