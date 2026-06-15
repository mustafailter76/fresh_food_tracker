class TrashHistoryModel {
  final int? id;
  final int foodId;
  final String foodName;
  final String foodImageKey;
  final DateTime trashedDate;
  final DateTime expiryDate;

  const TrashHistoryModel({
    this.id,
    required this.foodId,
    required this.foodName,
    required this.foodImageKey,
    required this.trashedDate,
    required this.expiryDate,
  });

  factory TrashHistoryModel.fromMap(Map<String, dynamic> map) {
    DateTime parseDate(String v) => DateTime.parse(v);

    return TrashHistoryModel(
      id: map['id'] is int ? map['id'] as int : (map['id'] as num?)?.toInt(),
      foodId: map['food_id'] is int
          ? map['food_id'] as int
          : (map['food_id'] as num).toInt(),
      foodName: map['food_name'] as String,
      foodImageKey: map['food_image_key'] as String,
      trashedDate: parseDate(map['trashed_date'] as String),
      expiryDate: parseDate(map['expiry_date'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'food_id': foodId,
      'food_name': foodName,
      'food_image_key': foodImageKey,
      'trashed_date': trashedDate.toIso8601String(),
      'expiry_date': expiryDate.toIso8601String(),
    };
    if (id != null) result['id'] = id;
    return result;
  }

  TrashHistoryModel copyWith({
    int? id,
    int? foodId,
    String? foodName,
    String? foodImageKey,
    DateTime? trashedDate,
    DateTime? expiryDate,
  }) {
    return TrashHistoryModel(
      id: id ?? this.id,
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      foodImageKey: foodImageKey ?? this.foodImageKey,
      trashedDate: trashedDate ?? this.trashedDate,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  @override
  String toString() =>
      'TrashHistoryModel{id: $id, foodId: $foodId, foodName: $foodName, trashedDate: $trashedDate, expiryDate: $expiryDate}';
}
