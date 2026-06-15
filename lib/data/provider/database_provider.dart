import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/database/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.instance;
});
