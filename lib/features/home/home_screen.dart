import 'package:flutter/material.dart';
import 'package:fresh_food_tracker/core/l10n/app_localizations.dart';
import 'package:fresh_food_tracker/core/router/route_name.dart';

import 'widgets/home_card.dart';
import 'widgets/home_destination.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final destinations = [
      HomeDestination(
        title: l10n.fridge,
        subtitle: l10n.fridgeTitle,
        icon: Icons.kitchen_rounded,
        color: const Color(0xFF4CAF50),
        routeName: fridgeRoute,
      ),
      HomeDestination(
        title: l10n.trash,
        subtitle: l10n.trashHistory,
        icon: Icons.delete_rounded,
        color: const Color(0xFFE53935),
        routeName: trashRoute,
      ),
      HomeDestination(
        title: l10n.stomach,
        subtitle: l10n.eatenHistory,
        icon: Icons.restaurant_rounded,
        color: const Color(0xFFFF9800),
        routeName: stomachRoute,
      ),
      HomeDestination(
        title: l10n.settings,
        subtitle: l10n.settingsTitle,
        icon: Icons.settings_rounded,
        color: const Color(0xFF607D8B),
        routeName: settingsRoute,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: destinations.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (context, index) {
                    final destination = destinations[index];
                    return HomeCard(destination: destination);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
