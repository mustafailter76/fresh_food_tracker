import 'package:fresh_food_tracker/data/dao/trash_history_dao.dart';
import 'package:fresh_food_tracker/data/model/trash_history_model.dart';

class TrashHistoryRepository {
  TrashHistoryRepository(this._dao);

  final TrashHistoryDao _dao;

  Future<List<TrashHistoryModel>> getAll() {
    return _dao.getAll();
  }

  Future<int> insert(TrashHistoryModel history) {
    return _dao.insert(history);
  }

  Future<int> clear() {
    return _dao.clear();
  }
}
