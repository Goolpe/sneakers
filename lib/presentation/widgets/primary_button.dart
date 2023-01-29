import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final Function() onPressed;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool tappedDown = false;

  static const duration = Duration(milliseconds: 300);

  void tap() {
    setState(() => tappedDown = true);
  }

  void unTap() {
    setState(() => tappedDown = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 48,
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      padding: EdgeInsets.all(tappedDown ? 4 : 0),
      duration: duration,
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Theme.of(context).primaryColor,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          onTapUp: (details) => unTap(),
          onTapCancel: () => unTap(),
          onTapDown: (details) => tap(),
          onTap: widget.onPressed,
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: duration,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontSize: tappedDown ? 12 : 14,
                      ) ??
                  const TextStyle(),
              child: Text(widget.title.toUpperCase()),
            ),
          ),
        ),
      ),
    );
  }
}
