import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/data/provider/database_provider.dart';
import 'package:fresh_food_tracker/data/provider/food_provider.dart';
import 'package:fresh_food_tracker/data/provider/fridge_provider.dart';
import 'package:fresh_food_tracker/data/provider/history_provider.dart';
import 'package:fresh_food_tracker/data/service/settings_service.dart';

class SettingsNotifier extends AsyncNotifier<void> {
  late final SettingsService _service;

  @override
  Future<void> build() async {
    _service = SettingsService(ref.read(appDatabaseProvider));
  }

  Future<void> resetDatabase() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _service.resetDatabase();

      ref.invalidate(foodsProvider);
      ref.invalidate(fridgeProvider);
      ref.invalidate(eatenHistoryProvider);
      ref.invalidate(trashHistoryProvider);
    });
  }
}

final settingsProvider = AsyncNotifierProvider<SettingsNotifier, void>(
  SettingsNotifier.new,
);
