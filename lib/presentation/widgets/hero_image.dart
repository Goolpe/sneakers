import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
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
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        if (flightDirection == HeroFlightDirection.pop) {
          return RotationTransition(
            turns: const AlwaysStoppedAnimation(-15 / 360),
            child: fromHeroContext.widget,
          );
        } else {
          return toHeroContext.widget;
        }
      },
      child: Material(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
