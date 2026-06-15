import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/model/fridge_item_model.dart';
import 'package:fresh_food_tracker/data/provider/fridge_provider.dart';
import 'package:fresh_food_tracker/shared/utils/food_presentation.dart';

import 'fridge_message.dart';

Future<void> showFoodActionDialog(
  BuildContext context,
  WidgetRef ref,
  FridgeItemModel item,
) async {
  final l10n = AppLocalizations.of(context);
  final food = item.food;
  if (food == null) return;

  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        icon: Image.asset(
          'assets/images/${food.imageKey}.png',
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) =>
              Icon(FoodPresentation.icon(food.imageKey)),
        ),
        title: Text(FoodPresentation.name(l10n, food.name)),
        content: Text(_expiryText(l10n, item.remainingDays)),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await ref
                  .read(fridgeProvider.notifier)
                  .trashFood(item.slot.slotIndex);
              if (!context.mounted) return;
              showFridgeMessage(context, l10n.trashSuccess);
            },
            child: Text(
              l10n.trash_action,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
          ElevatedButton(
            onPressed: item.isExpired
                ? null
                : () async {
                    try {
                      Navigator.of(dialogContext).pop();
                      await ref
                          .read(fridgeProvider.notifier)
                          .eatFood(item.slot.slotIndex);
                      if (!context.mounted) return;
                      showFridgeMessage(context, l10n.eatSuccess);
                    } catch (error) {
                      if (!context.mounted) return;
                      showFridgeMessage(context, l10n.expiredWarning);
                    }
                  },
            child: Text(l10n.eat),
          ),
        ],
      );
    },
  );
}

String _expiryText(AppLocalizations l10n, int? remainingDays) {
  if (remainingDays == null) return l10n.expiryDate;
  if (remainingDays < 0) return l10n.expiredDaysAgo(remainingDays.abs());
  if (remainingDays == 0) return l10n.expiresToday;
  return l10n.expiresIn(remainingDays);
}
