import 'package:flutter/material.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/model/trash_history_model.dart';
import 'package:fresh_food_tracker/shared/utils/food_presentation.dart';
import 'package:fresh_food_tracker/shared/widgets/stat_card.dart';

class TrashStats extends StatelessWidget {
  const TrashStats({required this.history, super.key});

  final List<TrashHistoryModel> history;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final latest = history.isEmpty ? null : history.first;

    return Row(
      children: [
        Expanded(
          child: StatCard(
            title: l10n.totalTrashed,
            value: history.length.toString(),
            icon: Icons.delete_rounded,
            iconColor: Theme.of(context).colorScheme.error,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: l10n.lastTrashed,
            value: latest == null
                ? l10n.noneYet
                : FoodPresentation.name(l10n, latest.foodName),
            icon: Icons.history_rounded,
            iconColor: Theme.of(context).colorScheme.error,
          ),
        ),
      ],
    );
  }
}
