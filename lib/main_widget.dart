import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/router/go_route_provider.dart';
import 'package:fresh_food_tracker/core/theme/theme.dart';
import 'package:fresh_food_tracker/data/provider/theme_provider.dart';
import 'package:fresh_food_tracker/data/provider/language_provider.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';

class MainWidget extends ConsumerWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(languageProvider);

    return MaterialApp.router(
      title: 'Fresh Food Tracker',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
