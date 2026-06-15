import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_destination.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({required this.destination, super.key});

  final HomeDestination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.goNamed(destination.routeName),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: destination.color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  destination.icon,
                  color: destination.color,
                  size: 30,
                ),
              ),
              const Spacer(),
              Text(destination.title, style: theme.textTheme.titleLarge),
              const SizedBox(height: 6),
              Text(
                destination.subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
