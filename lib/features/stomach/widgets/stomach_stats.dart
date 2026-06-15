import 'package:flutter/material.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/model/eaten_history_model.dart';
import 'package:fresh_food_tracker/shared/utils/food_presentation.dart';
import 'package:fresh_food_tracker/shared/widgets/stat_card.dart';

class StomachStats extends StatelessWidget {
  const StomachStats({required this.history, super.key});

  final List<EatenHistoryModel> history;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final latest = history.isEmpty ? null : history.first;

    return Row(
      children: [
        Expanded(
          child: StatCard(
            title: l10n.totalEaten,
            value: history.length.toString(),
            icon: Icons.restaurant_rounded,
            iconColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: l10n.lastEaten,
            value: latest == null
                ? l10n.noneYet
                : FoodPresentation.name(l10n, latest.foodName),
            icon: Icons.history_rounded,
            iconColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
