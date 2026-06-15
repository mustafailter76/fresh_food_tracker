import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/model/fridge_item_model.dart';
import 'package:fresh_food_tracker/data/provider/food_provider.dart';
import 'package:fresh_food_tracker/data/provider/fridge_provider.dart';
import 'package:fresh_food_tracker/shared/widgets/state/error_state.dart';
import 'package:fresh_food_tracker/shared/widgets/state/loading_state.dart';
import 'package:go_router/go_router.dart';

import 'widgets/fridge_slot_card.dart';
import 'widgets/fridge_food_action_dialog.dart';
import 'widgets/fridge_add_food_dialog.dart';

class FridgeScreen extends ConsumerWidget {
  const FridgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final fridgeState = ref.watch(fridgeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.fridgeTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.go('/home'),
        ),
        bottom: fridgeState.isLoading && fridgeState.hasValue
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(),
              )
            : null,
      ),
      body: fridgeState.when(
        loading: () => LoadingState(title: l10n.fridgeTitle),
        error: (error, stackTrace) => ErrorState(
          title: 'Could not load fridge',
          description: error.toString(),
          action: ElevatedButton(
            onPressed: () => ref.read(fridgeProvider.notifier).refresh(),
            child: const Text('Retry'),
          ),
        ),
        data: (items) => _FridgeBody(items: items),
        skipLoadingOnReload: true,
        skipError: true,
      ),
    );
  }
}

class _FridgeBody extends ConsumerWidget {
  const _FridgeBody({required this.items});

  final List<FridgeItemModel> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final foodsState = ref.watch(foodsProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  const Color(0xFF1A2744),
                  const Color(0xFF0D1B2A),
                  const Color(0xFF0A1628),
                ]
              : [
                  const Color(0xFFE3F2FD),
                  const Color(0xFFBBDEFB),
                  const Color(0xFFE8F5E9),
                ],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  Icon(
                    Icons.kitchen_rounded,
                    color: isDark
                        ? Colors.lightBlueAccent
                        : const Color(0xFF1565C0),
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.emptyFridge,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? Colors.lightBlueAccent
                          : const Color(0xFF1565C0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return FridgeSlotCard(
                      item: item,
                      onTap: () {
                        if (item.isEmpty) {
                          foodsState.whenOrNull(
                            data: (foods) => showAddFoodDialog(
                              context: context,
                              ref: ref,
                              foods: foods,
                              slotIndex: item.slot.slotIndex,
                            ),
                          );
                        } else {
                          showFoodActionDialog(context, ref, item);
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
