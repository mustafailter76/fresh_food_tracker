import 'package:fresh_food_tracker/data/model/eaten_history_model.dart';
import 'package:fresh_food_tracker/data/model/fridge_item_model.dart';
import 'package:fresh_food_tracker/data/model/trash_history_model.dart';
import 'package:fresh_food_tracker/data/repository/eaten_history_repository.dart';
import 'package:fresh_food_tracker/data/repository/food_repository.dart';
import 'package:fresh_food_tracker/data/repository/fridge_slot_repository.dart';
import 'package:fresh_food_tracker/data/repository/trash_history_repository.dart';

class FridgeService {
  FridgeService({
    required FridgeSlotRepository fridgeSlotRepository,
    required FoodRepository foodRepository,
    required EatenHistoryRepository eatenHistoryRepository,
    required TrashHistoryRepository trashHistoryRepository,
  }) : _fridgeSlotRepository = fridgeSlotRepository,
       _foodRepository = foodRepository,
       _eatenHistoryRepository = eatenHistoryRepository,
       _trashHistoryRepository = trashHistoryRepository;

  final FridgeSlotRepository _fridgeSlotRepository;
  final FoodRepository _foodRepository;
  final EatenHistoryRepository _eatenHistoryRepository;
  final TrashHistoryRepository _trashHistoryRepository;

  Future<List<FridgeItemModel>> getFridgeItems() async {
    final slots = await _fridgeSlotRepository.getAllSlots();
    final items = <FridgeItemModel>[];

    for (final slot in slots) {
      final foodId = slot.foodId;
      final food = foodId == null
          ? null
          : await _foodRepository.getFoodById(foodId);

      items.add(FridgeItemModel(slot: slot, food: food));
    }

    return items;
  }

  Future<void> placeFood({
    required int slotIndex,
    required int foodId,
    required DateTime expiryDate,
  }) {
    return _fridgeSlotRepository.placeFood(
      slotIndex: slotIndex,
      foodId: foodId,
      expiryDate: expiryDate,
    );
  }

  Future<void> eatFood(int slotIndex) async {
    final slot = await _fridgeSlotRepository.getSlotByIndex(slotIndex);

    if (slot == null || slot.foodId == null || slot.expiryDate == null) {
      throw Exception('Bu slot bos.');
    }

    if (_isExpired(slot.expiryDate!)) {
      throw Exception('Son kullanma tarihi gecmis yiyecek yenemez.');
    }

    final food = await _foodRepository.getFoodById(slot.foodId!);

    if (food == null || food.id == null) {
      throw Exception('Yiyecek bulunamadi.');
    }

    await _eatenHistoryRepository.insert(
      EatenHistoryModel(
        foodId: food.id!,
        foodName: food.name,
        foodImageKey: food.imageKey,
        eatenDate: DateTime.now(),
        expiryDate: slot.expiryDate!,
      ),
    );

    await _fridgeSlotRepository.clearSlot(slotIndex);
  }

  Future<void> trashFood(int slotIndex) async {
    final slot = await _fridgeSlotRepository.getSlotByIndex(slotIndex);

    if (slot == null || slot.foodId == null || slot.expiryDate == null) {
      throw Exception('Bu slot bos.');
    }

    final food = await _foodRepository.getFoodById(slot.foodId!);

    if (food == null || food.id == null) {
      throw Exception('Yiyecek bulunamadi.');
    }

    await _trashHistoryRepository.insert(
      TrashHistoryModel(
        foodId: food.id!,
        foodName: food.name,
        foodImageKey: food.imageKey,
        trashedDate: DateTime.now(),
        expiryDate: slot.expiryDate!,
      ),
    );

    await _fridgeSlotRepository.clearSlot(slotIndex);
  }

  bool _isExpired(DateTime expiryDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final expiry = DateTime(expiryDate.year, expiryDate.month, expiryDate.day);

    return expiry.isBefore(today);
  }
}
