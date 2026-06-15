import 'package:flutter/material.dart';

import 'base_state.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.title,
    required this.description,
    this.icon = const Icon(Icons.error_outline_rounded),
    this.action,
  });

  final Widget icon;
  final String title;
  final String description;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseState(
      icon: IconTheme(
        data: IconThemeData(size: 56, color: colorScheme.error),
        child: icon,
      ),
      title: title,
      description: description,
      action: action,
    );
  }
}
