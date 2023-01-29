import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  const SquareIconButton({
    required this.icon,
    this.onTap,
    this.iconSize,
    super.key,
  });

  final IconData icon;
  final Function()? onTap;
  final double? iconSize;

  static const radius = BorderRadius.all(Radius.circular(8));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: radius,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.grey[200],
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(icon, size: iconSize),
          ),
        ),
      ),
    );
  }
}
