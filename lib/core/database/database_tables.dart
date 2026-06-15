class DatabaseTables {
  DatabaseTables._();

  static const String foods = 'foods';
  static const String fridgeSlots = 'fridge_slots';
  static const String eatenHistory = 'eaten_history';
  static const String trashHistory = 'trash_history';

  static const String createFoodsTableIfNotExists =
      '''
    CREATE TABLE IF NOT EXISTS $foods (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      image_key TEXT NOT NULL,
      is_default INTEGER NOT NULL DEFAULT 0
    )
  ''';

  static const String createFridgeSlotsTableIfNotExists =
      '''
    CREATE TABLE IF NOT EXISTS $fridgeSlots (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      slot_index INTEGER NOT NULL UNIQUE,
      food_id INTEGER,
      expiry_date TEXT,
      added_date TEXT,
      FOREIGN KEY (food_id) REFERENCES $foods (id)
    )
  ''';

  static const String createEatenHistoryTableIfNotExists =
      '''
    CREATE TABLE IF NOT EXISTS $eatenHistory (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      food_id INTEGER NOT NULL,
      food_name TEXT NOT NULL,
      food_image_key TEXT NOT NULL,
      eaten_date TEXT NOT NULL,
      expiry_date TEXT NOT NULL,
      FOREIGN KEY (food_id) REFERENCES $foods (id)
    )
  ''';

  static const String createTrashHistoryTableIfNotExists =
      '''
    CREATE TABLE IF NOT EXISTS $trashHistory (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      food_id INTEGER NOT NULL,
      food_name TEXT NOT NULL,
      food_image_key TEXT NOT NULL,
      trashed_date TEXT NOT NULL,
      expiry_date TEXT NOT NULL,
      FOREIGN KEY (food_id) REFERENCES $foods (id)
    )
  ''';

  static const String createFoodsTable = createFoodsTableIfNotExists;
  static const String createFridgeSlotsTable =
      createFridgeSlotsTableIfNotExists;
  static const String createEatenHistoryTable =
      createEatenHistoryTableIfNotExists;
  static const String createTrashHistoryTable =
      createTrashHistoryTableIfNotExists;
}
