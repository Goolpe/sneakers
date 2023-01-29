import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  FadePageRoute({required Function(BuildContext) builder})
      : super(
          pageBuilder: (context, animation1, animation2) {
            return builder(context);
          },
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, a, __, c) => FadeTransition(
            opacity: a,
            child: c,
          ),
        );
}
