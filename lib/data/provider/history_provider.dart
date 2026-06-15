import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/data/dao/eaten_history_dao.dart';
import 'package:fresh_food_tracker/data/dao/trash_history_dao.dart';
import 'package:fresh_food_tracker/data/model/eaten_history_model.dart';
import 'package:fresh_food_tracker/data/model/trash_history_model.dart';
import 'package:fresh_food_tracker/data/provider/database_provider.dart';
import 'package:fresh_food_tracker/data/repository/eaten_history_repository.dart';
import 'package:fresh_food_tracker/data/repository/trash_history_repository.dart';

final eatenHistoryProvider = FutureProvider<List<EatenHistoryModel>>((ref) {
  final database = ref.watch(appDatabaseProvider);
  final repository = EatenHistoryRepository(EatenHistoryDao(database));

  return repository.getAll();
});

final trashHistoryProvider = FutureProvider<List<TrashHistoryModel>>((ref) {
  final database = ref.watch(appDatabaseProvider);
  final repository = TrashHistoryRepository(TrashHistoryDao(database));

  return repository.getAll();
});
