import 'package:flutter/material.dart';

class HomeDestination {
  const HomeDestination({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.routeName,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String routeName;
}
