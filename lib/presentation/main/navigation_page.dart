import 'package:flutter/material.dart';

abstract class NavigationPage extends StatelessWidget {
  const NavigationPage({required this.icon, super.key});

  final IconData icon;
}
