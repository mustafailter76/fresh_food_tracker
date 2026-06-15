import 'package:fresh_food_tracker/data/dao/eaten_history_dao.dart';
import 'package:fresh_food_tracker/data/model/eaten_history_model.dart';

class EatenHistoryRepository {
  EatenHistoryRepository(this._dao);

  final EatenHistoryDao _dao;

  Future<List<EatenHistoryModel>> getAll() {
    return _dao.getAll();
  }

  Future<int> insert(EatenHistoryModel history) {
    return _dao.insert(history);
  }

  Future<int> clear() {
    return _dao.clear();
  }
}
