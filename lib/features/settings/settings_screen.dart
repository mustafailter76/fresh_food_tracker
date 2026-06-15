import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/provider/language_provider.dart';
import 'package:fresh_food_tracker/data/provider/settings_provider.dart';
import 'package:fresh_food_tracker/data/provider/theme_provider.dart';
import 'package:go_router/go_router.dart';

import 'widgets/settings_reset_dialog.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(languageProvider);
    final settingsState = ref.watch(settingsProvider);

    ref.listen(settingsProvider, (previous, next) {
      next.whenOrNull(
        error: (err, _) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Hata: ${err.toString()}')));
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.dark_mode_rounded),
                title: Text(l10n.themeMode),
                value: themeMode == ThemeMode.dark,
                onChanged: (_) => ref.read(themeProvider.notifier).toggle(),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.language_rounded),
                title: Text(l10n.language),
                subtitle: Text(
                  locale.languageCode == 'tr' ? 'Türkçe' : 'English',
                ),
                value: locale.languageCode == 'tr',
                onChanged: (isTurkish) {
                  ref
                      .read(languageProvider.notifier)
                      .setLocale(
                        isTurkish ? const Locale('tr') : const Locale('en'),
                      );
                },
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.restart_alt_rounded,
                  color: Theme.of(context).colorScheme.error,
                ),
                title: Text(
                  l10n.resetDatabase,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                trailing: settingsState.when(
                  loading: () => const SizedBox.square(
                    dimension: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (_, __) => Icon(
                    Icons.warning_amber_rounded,
                    color: Theme.of(context).colorScheme.error,
                    size: 22,
                  ),
                  data: (_) => const Icon(Icons.chevron_right_rounded),
                ),
                onTap: settingsState.isLoading
                    ? null
                    : () => showSettingsResetDialog(context, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
