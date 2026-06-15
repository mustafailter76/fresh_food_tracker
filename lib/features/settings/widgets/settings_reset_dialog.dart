import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/provider/settings_provider.dart';
import 'package:fresh_food_tracker/shared/widgets/base_dialog.dart';

Future<void> showSettingsResetDialog(
  BuildContext context,
  WidgetRef ref,
) async {
  final l10n = AppLocalizations.of(context);

  final confirmed = await BaseDialog.show(
    context: context,
    icon: Icon(
      Icons.warning_amber_rounded,
      color: Theme.of(context).colorScheme.error,
    ),
    title: l10n.resetDatabase,
    description: l10n.resetDatabaseConfirm,
    cancelButtonTitle: l10n.no,
    confirmButtonTitle: l10n.yes,
  );

  if (confirmed != true) return;

  await ref.read(settingsProvider.notifier).resetDatabase();
  if (!context.mounted) return;

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(l10n.databaseReset)));
}
