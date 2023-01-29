import 'package:flutter/material.dart';
import 'package:sneakers/presentation/main/navigation_page.dart';

class EmptyPage extends NavigationPage {
  const EmptyPage({
    required super.icon,
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
