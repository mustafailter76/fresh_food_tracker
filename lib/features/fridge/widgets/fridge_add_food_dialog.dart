import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/model/food_model.dart';
import 'package:fresh_food_tracker/data/provider/fridge_provider.dart';
import 'package:fresh_food_tracker/shared/utils/date_formatter.dart';
import 'package:fresh_food_tracker/shared/utils/food_presentation.dart';

Future<void> showAddFoodDialog({
  required BuildContext context,
  required WidgetRef ref,
  required List<FoodModel> foods,
  required int slotIndex,
}) async {
  final l10n = AppLocalizations.of(context);
  int? selectedFoodId = foods.isEmpty ? null : foods.first.id;
  DateTime? selectedDate;

  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (ctx, setDialogState) {
          return AlertDialog(
            icon: const Icon(Icons.add_circle_outline_rounded),
            title: Text(l10n.addFood),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<int>(
                    value: selectedFoodId,
                    decoration: InputDecoration(labelText: l10n.selectFood),
                    items: foods
                        .where((food) => food.id != null)
                        .map(
                          (food) => DropdownMenuItem<int>(
                            value: food.id,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/${food.imageKey}.png',
                                  width: 20,
                                  height: 20,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(
                                        FoodPresentation.icon(food.imageKey),
                                        size: 20,
                                      ),
                                ),
                                const SizedBox(width: 10),
                                Text(FoodPresentation.name(l10n, food.name)),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setDialogState(() => selectedFoodId = value);
                    },
                  ),
                  const SizedBox(height: 14),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final now = DateTime.now();
                      final picked = await showDatePicker(
                        context: ctx,
                        initialDate: now,
                        firstDate: DateTime(now.year - 1),
                        lastDate: DateTime(now.year + 3),
                      );
                      if (picked == null) return;
                      setDialogState(() => selectedDate = picked);
                    },
                    icon: const Icon(Icons.calendar_month_rounded),
                    label: Text(
                      selectedDate == null
                          ? l10n.selectDate
                          : DateFormatter.short(selectedDate!),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(l10n.cancel),
              ),
              ElevatedButton(
                onPressed: selectedFoodId == null || selectedDate == null
                    ? null
                    : () async {
                        await ref
                            .read(fridgeProvider.notifier)
                            .placeFood(
                              slotIndex: slotIndex,
                              foodId: selectedFoodId!,
                              expiryDate: selectedDate!,
                            );
                        if (dialogContext.mounted) {
                          Navigator.of(dialogContext).pop();
                        }
                      },
                child: Text(l10n.place),
              ),
            ],
          );
        },
      );
    },
  );
}
