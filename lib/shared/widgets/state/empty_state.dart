import 'package:flutter/material.dart';

import 'base_state.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.title,
    required this.description,
    this.icon = const Icon(Icons.inbox_outlined),
    this.action,
  });

  final Widget icon;
  final String title;
  final String description;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return BaseState(
      icon: icon,
      title: title,
      description: description,
      action: action,
    );
  }
}
