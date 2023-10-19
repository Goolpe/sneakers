import 'package:flutter/material.dart';
import 'package:sneakers/core/utils/double.dart';
import 'package:sneakers/presentation/widgets/large_title.dart';

class SizesComponent extends StatefulWidget {
  const SizesComponent({required this.sizes, super.key});

  final List<double> sizes;

  @override
  State<SizesComponent> createState() => _SizesComponentState();
}

class _SizesComponentState extends State<SizesComponent> {
  double? _currentSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LargeTitle('Size'),
              Row(
                children: [
                  LargeTitle('UK'),
                  SizedBox(width: 8),
                  LargeTitle('USA', color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 8,
                ),
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        'Try it',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.handshake_outlined),
                    ],
                  ),
                ),
              ),
              for (var size in widget.sizes)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: OutlinedButton(
                    style: _currentSize == size
                        ? OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          )
                        : null,
                    onPressed: () {
                      setState(() {
                        _currentSize = size;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        size.cutTrailingZeros(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
