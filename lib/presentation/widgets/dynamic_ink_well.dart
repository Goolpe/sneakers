import 'package:flutter/material.dart';

class DynamicInkWell extends StatefulWidget {
  const DynamicInkWell({
    required this.child,
    required this.onTap,
    super.key,
  });

  final Widget Function(bool tappedDown) child;
  final Function() onTap;

  @override
  State<DynamicInkWell> createState() => _DynamicInkWellState();
}

class _DynamicInkWellState extends State<DynamicInkWell> {
  bool tappedDown = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTapUp: (details) {
        setState(() {
          tappedDown = false;
        });
      },
      onTapCancel: () {
        setState(() {
          tappedDown = false;
        });
      },
      onTapDown: (details) {
        setState(() {
          tappedDown = true;
        });
      },
      onTap: widget.onTap,
      child: widget.child(tappedDown),
    );
  }
}
