import 'package:flutter/material.dart';

class LargeTitle extends StatelessWidget {
  const LargeTitle(
    this.title, {
    this.color,
    super.key,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
    );
  }
}
