import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/router/route_name.dart';
import 'package:fresh_food_tracker/features/fridge/fridge_screen.dart';
import 'package:fresh_food_tracker/features/home/home_screen.dart';
import 'package:fresh_food_tracker/features/trash/trash_screen.dart';
import 'package:fresh_food_tracker/features/stomach/stomach_screen.dart';
import 'package:fresh_food_tracker/features/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: homePath,
    routes: [
      GoRoute(
        path: homePath,
        name: homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: fridgePath,
        name: fridgeRoute,
        builder: (context, state) => const FridgeScreen(),
      ),
      GoRoute(
        path: trashPath,
        name: trashRoute,
        builder: (context, state) => const TrashScreen(),
      ),
      GoRoute(
        path: stomachPath,
        name: stomachRoute,
        builder: (context, state) => const StomachScreen(),
      ),
      GoRoute(
        path: settingsPath,
        name: settingsRoute,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});
