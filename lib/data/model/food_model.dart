class FoodModel {
  final int? id;
  final String name;
  final String imageKey;
  final bool isDefault;

  const FoodModel({
    this.id,
    required this.name,
    required this.imageKey,
    this.isDefault = false,
  });

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'] is int ? map['id'] as int : (map['id'] as num?)?.toInt(),
      name: map['name'] as String,
      imageKey: map['image_key'] as String,
      isDefault: (map['is_default'] == 1) || (map['is_default'] == true),
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'name': name,
      'image_key': imageKey,
      'is_default': isDefault ? 1 : 0,
    };
    if (id != null) result['id'] = id;
    return result;
  }

  FoodModel copyWith({
    int? id,
    String? name,
    String? imageKey,
    bool? isDefault,
  }) {
    return FoodModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageKey: imageKey ?? this.imageKey,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  String toString() =>
      'FoodModel{id: $id, name: $name, imageKey: $imageKey, isDefault: $isDefault}';
}
