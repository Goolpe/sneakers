import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  const UnderlinedText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        shadows: [
          Shadow(
            color: Colors.black,
            offset: Offset(0, -5),
          )
        ],
        fontSize: 12,
        color: Colors.transparent,
        decorationColor: Colors.black,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
