import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/data/dao/food_dao.dart';
import 'package:fresh_food_tracker/data/model/food_model.dart';
import 'package:fresh_food_tracker/data/provider/database_provider.dart';
import 'package:fresh_food_tracker/data/repository/food_repository.dart';

final foodsProvider = FutureProvider<List<FoodModel>>((ref) {
  final database = ref.watch(appDatabaseProvider);
  final repository = FoodRepository(FoodDao(database));

  return repository.getAllFoods();
});
