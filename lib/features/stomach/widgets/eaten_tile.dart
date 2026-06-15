import 'package:flutter/material.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/model/eaten_history_model.dart';
import 'package:fresh_food_tracker/shared/utils/date_formatter.dart';
import 'package:fresh_food_tracker/shared/utils/food_presentation.dart';

class EatenTile extends StatelessWidget {
  const EatenTile({required this.item, super.key});

  final EatenHistoryModel item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: ClipOval(
            child: Image.asset(
              'assets/images/${item.foodImageKey}.png',
              width: 28,
              height: 28,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                FoodPresentation.icon(item.foodImageKey),
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        title: Text(FoodPresentation.name(l10n, item.foodName)),
        subtitle: Text(
          '${l10n.eatenOn}: ${DateFormatter.short(item.eatenDate)}',
        ),
        trailing: Icon(
          Icons.restaurant_rounded,
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
          size: 20,
        ),
      ),
    );
  }
}
