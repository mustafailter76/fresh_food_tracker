class FridgeSlotModel {
  final int? id;
  final int slotIndex;
  final int? foodId;
  final DateTime? expiryDate;
  final DateTime? addedDate;

  const FridgeSlotModel({
    this.id,
    required this.slotIndex,
    this.foodId,
    this.expiryDate,
    this.addedDate,
  });

  factory FridgeSlotModel.fromMap(Map<String, dynamic> map) {
    DateTime? parseDate(dynamic v) {
      if (v == null) return null;
      if (v is String) return DateTime.tryParse(v);
      return null;
    }

    return FridgeSlotModel(
      id: map['id'] is int ? map['id'] as int : (map['id'] as num?)?.toInt(),
      slotIndex: map['slot_index'] is int
          ? map['slot_index'] as int
          : (map['slot_index'] as num).toInt(),
      foodId: map['food_id'] is int
          ? map['food_id'] as int
          : (map['food_id'] as num?)?.toInt(),
      expiryDate: parseDate(map['expiry_date']),
      addedDate: parseDate(map['added_date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'slot_index': slotIndex,
      'food_id': foodId,
      'expiry_date': expiryDate?.toIso8601String(),
      'added_date': addedDate?.toIso8601String(),
    };
  }

  FridgeSlotModel copyWith({
    int? id,
    int? slotIndex,
    int? foodId,
    DateTime? expiryDate,
    DateTime? addedDate,
  }) {
    return FridgeSlotModel(
      id: id ?? this.id,
      slotIndex: slotIndex ?? this.slotIndex,
      foodId: foodId ?? this.foodId,
      expiryDate: expiryDate ?? this.expiryDate,
      addedDate: addedDate ?? this.addedDate,
    );
  }

  @override
  String toString() =>
      'FridgeSlotModel{id: $id, slotIndex: $slotIndex, foodId: $foodId, expiryDate: $expiryDate, addedDate: $addedDate}';
}
