import 'package:fresh_food_tracker/data/model/food_model.dart';
import 'package:fresh_food_tracker/data/model/fridge_slot_model.dart';

class FridgeItemModel {
  const FridgeItemModel({required this.slot, this.food});

  final FridgeSlotModel slot;
  final FoodModel? food;

  bool get isEmpty => food == null || slot.foodId == null;

  bool get isExpired {
    final expiryDate = slot.expiryDate;
    if (expiryDate == null) return false;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final expiry = DateTime(expiryDate.year, expiryDate.month, expiryDate.day);

    return expiry.isBefore(today);
  }

  int? get remainingDays {
    final expiryDate = slot.expiryDate;
    if (expiryDate == null) return null;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final expiry = DateTime(expiryDate.year, expiryDate.month, expiryDate.day);

    return expiry.difference(today).inDays;
  }
}
