import 'package:flutter/material.dart';
import 'package:fresh_food_tracker/core/theme/theme.dart';

enum ExpiryStatus {
  fresh,
  expiringSoon,
  expired;

  static ExpiryStatus fromRemainingDays(int? days) {
    if (days == null) return ExpiryStatus.fresh;
    if (days < 0) return ExpiryStatus.expired;
    if (days <= 2) return ExpiryStatus.expiringSoon;
    return ExpiryStatus.fresh;
  }

  Color get color {
    switch (this) {
      case ExpiryStatus.fresh:
        return AppTheme.expiryFreshColor;
      case ExpiryStatus.expiringSoon:
        return AppTheme.expirySoonColor;
      case ExpiryStatus.expired:
        return AppTheme.expiryExpiredColor;
    }
  }
}
