class EatenHistoryModel {
  final int? id;
  final int foodId;
  final String foodName;
  final String foodImageKey;
  final DateTime eatenDate;
  final DateTime expiryDate;

  const EatenHistoryModel({
    this.id,
    required this.foodId,
    required this.foodName,
    required this.foodImageKey,
    required this.eatenDate,
    required this.expiryDate,
  });

  factory EatenHistoryModel.fromMap(Map<String, dynamic> map) {
    DateTime parseDate(String v) => DateTime.parse(v);

    return EatenHistoryModel(
      id: map['id'] is int ? map['id'] as int : (map['id'] as num?)?.toInt(),
      foodId: map['food_id'] is int
          ? map['food_id'] as int
          : (map['food_id'] as num).toInt(),
      foodName: map['food_name'] as String,
      foodImageKey: map['food_image_key'] as String,
      eatenDate: parseDate(map['eaten_date'] as String),
      expiryDate: parseDate(map['expiry_date'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'food_id': foodId,
      'food_name': foodName,
      'food_image_key': foodImageKey,
      'eaten_date': eatenDate.toIso8601String(),
      'expiry_date': expiryDate.toIso8601String(),
    };
    if (id != null) result['id'] = id;
    return result;
  }

  EatenHistoryModel copyWith({
    int? id,
    int? foodId,
    String? foodName,
    String? foodImageKey,
    DateTime? eatenDate,
    DateTime? expiryDate,
  }) {
    return EatenHistoryModel(
      id: id ?? this.id,
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      foodImageKey: foodImageKey ?? this.foodImageKey,
      eatenDate: eatenDate ?? this.eatenDate,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  @override
  String toString() =>
      'EatenHistoryModel{id: $id, foodId: $foodId, foodName: $foodName, eatenDate: $eatenDate, expiryDate: $expiryDate}';
}
