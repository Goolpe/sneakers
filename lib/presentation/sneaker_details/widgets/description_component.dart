import 'package:flutter/material.dart';
import 'package:sneakers/presentation/widgets/underlined_text.dart';

class DescriptionComponent extends StatelessWidget {
  const DescriptionComponent({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).disabledColor,
                  height: 1.3,
                ),
          ),
          const SizedBox(height: 24),
          UnderlinedText('More Details'.toUpperCase()),
        ],
      ),
    );
  }
}
