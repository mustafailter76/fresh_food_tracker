import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/data/dao/eaten_history_dao.dart';
import 'package:fresh_food_tracker/data/dao/food_dao.dart';
import 'package:fresh_food_tracker/data/dao/fridge_slot_dao.dart';
import 'package:fresh_food_tracker/data/dao/trash_history_dao.dart';
import 'package:fresh_food_tracker/data/model/fridge_item_model.dart';
import 'package:fresh_food_tracker/data/provider/database_provider.dart';
import 'package:fresh_food_tracker/data/provider/history_provider.dart';
import 'package:fresh_food_tracker/data/repository/eaten_history_repository.dart';
import 'package:fresh_food_tracker/data/repository/food_repository.dart';
import 'package:fresh_food_tracker/data/repository/fridge_slot_repository.dart';
import 'package:fresh_food_tracker/data/repository/trash_history_repository.dart';
import 'package:fresh_food_tracker/data/service/fridge_service.dart';
import 'package:fresh_food_tracker/data/service/sound_service.dart';

class FridgeNotifier extends AsyncNotifier<List<FridgeItemModel>> {
  late final FridgeService _service;

  @override
  Future<List<FridgeItemModel>> build() {
    _service = _createService();
    return _service.getFridgeItems();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_service.getFridgeItems);
  }

  Future<void> placeFood({
    required int slotIndex,
    required int foodId,
    required DateTime expiryDate,
  }) async {
    await _service.placeFood(
      slotIndex: slotIndex,
      foodId: foodId,
      expiryDate: expiryDate,
    );

    await refresh();
  }

  Future<void> eatFood(int slotIndex) async {
    await _service.eatFood(slotIndex);
    await SoundService.playEat();

    ref.invalidate(eatenHistoryProvider);
    await refresh();
  }

  Future<void> trashFood(int slotIndex) async {
    await _service.trashFood(slotIndex);
    await SoundService.playTrash();

    ref.invalidate(trashHistoryProvider);
    await refresh();
  }

  FridgeService _createService() {
    final database = ref.read(appDatabaseProvider);

    return FridgeService(
      fridgeSlotRepository: FridgeSlotRepository(FridgeSlotDao(database)),
      foodRepository: FoodRepository(FoodDao(database)),
      eatenHistoryRepository: EatenHistoryRepository(EatenHistoryDao(database)),
      trashHistoryRepository: TrashHistoryRepository(TrashHistoryDao(database)),
    );
  }
}

final fridgeProvider =
    AsyncNotifierProvider<FridgeNotifier, List<FridgeItemModel>>(
      FridgeNotifier.new,
    );
