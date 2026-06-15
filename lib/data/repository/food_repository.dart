import 'package:fresh_food_tracker/data/dao/food_dao.dart';
import 'package:fresh_food_tracker/data/model/food_model.dart';

class FoodRepository {
  FoodRepository(this._dao);

  final FoodDao _dao;

  Future<List<FoodModel>> getAllFoods() {
    return _dao.getAllFoods();
  }

  Future<FoodModel?> getFoodById(int id) {
    return _dao.getFoodById(id);
  }

  Future<int> insertFood(FoodModel food) {
    return _dao.insertFood(food);
  }

  Future<int> deleteCustomFoods() {
    return _dao.deleteCustomFoods();
  }
}
