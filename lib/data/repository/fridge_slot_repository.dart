import 'package:fresh_food_tracker/data/dao/fridge_slot_dao.dart';
import 'package:fresh_food_tracker/data/model/fridge_slot_model.dart';

class FridgeSlotRepository {
  FridgeSlotRepository(this._dao);

  final FridgeSlotDao _dao;

  Future<List<FridgeSlotModel>> getAllSlots() {
    return _dao.getAllSlots();
  }

  Future<FridgeSlotModel?> getSlotByIndex(int slotIndex) {
    return _dao.getSlotByIndex(slotIndex);
  }

  Future<void> placeFood({
    required int slotIndex,
    required int foodId,
    required DateTime expiryDate,
  }) {
    return _dao.placeFood(
      slotIndex: slotIndex,
      foodId: foodId,
      expiryDate: expiryDate,
    );
  }

  Future<void> clearSlot(int slotIndex) {
    return _dao.clearSlot(slotIndex);
  }

  Future<void> clearAllSlots() {
    return _dao.clearAllSlots();
  }
}
