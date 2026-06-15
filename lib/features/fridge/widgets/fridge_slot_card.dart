import 'package:flutter/material.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/data/enum/expiry_status.dart';
import 'package:fresh_food_tracker/data/model/fridge_item_model.dart';
import 'package:fresh_food_tracker/shared/utils/date_formatter.dart';
import 'package:fresh_food_tracker/shared/utils/food_presentation.dart';

class FridgeSlotCard extends StatelessWidget {
  const FridgeSlotCard({required this.item, required this.onTap, super.key});

  final FridgeItemModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final status = ExpiryStatus.fromRemainingDays(item.remainingDays);
    final statusColor = item.isEmpty
        ? (isDark ? Colors.lightBlueAccent : const Color(0xFF1565C0))
        : status.color;

    final cardBg = isDark
        ? const Color(0xFF1E2D4A).withValues(alpha: 0.85)
        : Colors.white.withValues(alpha: 0.88);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: statusColor.withValues(alpha: 0.55),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: statusColor.withValues(alpha: 0.15),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: item.isEmpty
              ? _EmptySlot(color: statusColor)
              : _FoodSlot(item: item),
        ),
      ),
    );
  }
}

class _EmptySlot extends StatelessWidget {
  const _EmptySlot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
          ),
          child: Icon(Icons.add_rounded, size: 32, color: color),
        ),
        const SizedBox(height: 10),
        Text(
          AppLocalizations.of(context).addFood,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}

class _FoodSlot extends StatelessWidget {
  const _FoodSlot({required this.item});

  final FridgeItemModel item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final food = item.food!;
    final status = ExpiryStatus.fromRemainingDays(item.remainingDays);
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: status.color.withValues(alpha: 0.14),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/${food.imageKey}.png',
              width: 34,
              height: 34,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                FoodPresentation.icon(food.imageKey),
                size: 34,
                color: status.color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          FoodPresentation.name(l10n, food.name),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleLarge?.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 4),
        Text(
          item.slot.expiryDate == null
              ? l10n.expiryDate
              : DateFormatter.short(item.slot.expiryDate!),
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 11),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: status.color.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: status.color.withValues(alpha: 0.35)),
          ),
          child: Text(
            _expiryText(l10n, item.remainingDays),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: status.color,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

String _expiryText(AppLocalizations l10n, int? remainingDays) {
  if (remainingDays == null) return l10n.expiryDate;
  if (remainingDays < 0) return l10n.expiredDaysAgo(remainingDays.abs());
  if (remainingDays == 0) return l10n.expiresToday;
  return l10n.expiresIn(remainingDays);
}
