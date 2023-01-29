import 'package:flutter/material.dart';

class HeroColor extends StatelessWidget {
  const HeroColor({
    required this.tag,
    required this.child,
    super.key,
  });

  final String tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: tag,
      child: Material(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
