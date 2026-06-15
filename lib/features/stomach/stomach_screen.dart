import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/model/eaten_history_model.dart';
import 'package:fresh_food_tracker/data/provider/history_provider.dart';
import 'package:fresh_food_tracker/shared/widgets/state/empty_state.dart';
import 'package:fresh_food_tracker/shared/widgets/state/error_state.dart';
import 'package:fresh_food_tracker/shared/widgets/state/loading_state.dart';
import 'package:go_router/go_router.dart';

import 'widgets/eaten_tile.dart';
import 'widgets/stomach_stats.dart';

class StomachScreen extends ConsumerWidget {
  const StomachScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final historyState = ref.watch(eatenHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.stomachTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.go('/home'),
        ),
        bottom: historyState.isLoading && historyState.hasValue
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(),
              )
            : null,
      ),
      body: historyState.when(
        loading: () => LoadingState(title: l10n.stomachTitle),
        error: (error, stackTrace) => ErrorState(
          title: 'Could not load eaten history',
          description: error.toString(),
        ),
        data: (history) => _StomachBody(history: history),
        skipLoadingOnReload: true,
        skipError: true,
      ),
    );
  }
}

class _StomachBody extends StatelessWidget {
  const _StomachBody({required this.history});

  final List<EatenHistoryModel> history;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (history.isEmpty) {
      return EmptyState(
        icon: const Icon(Icons.restaurant_rounded),
        title: l10n.stomachTitle,
        description: l10n.emptyStomach,
      );
    }

    return SafeArea(
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: history.length + 1,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) return StomachStats(history: history);
          return EatenTile(item: history[index - 1]);
        },
      ),
    );
  }
}
