import 'package:flutter/material.dart';
import 'package:sneakers/domain/entities/sneaker.dart';
import 'package:sneakers/presentation/widgets/hero_color.dart';
import 'package:sneakers/presentation/widgets/hero_image.dart';

class SneakerDetailsAppBar extends StatelessWidget {
  const SneakerDetailsAppBar({required this.sneaker, super.key});

  final Sneaker sneaker;

  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width / 1.4;

    return SliverAppBar(
      pinned: true,
      backgroundColor: sneaker.color,
      expandedHeight: 350,
      toolbarHeight: 80,
      foregroundColor: sneaker.estimatedColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.keyboard_backspace),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        sneaker.brandName,
        style: TextStyle(
          fontSize: 24,
          color: sneaker.estimatedColor,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: -radius / 1.2,
              right: -radius / 2,
              child: HeroColor(
                tag: '${sneaker.id}color',
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: sneaker.color,
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: HeroImage(
                tag: '${sneaker.id}image',
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(15 / 360),
                  child: Image.asset(
                    sneaker.image,
                    height: 350,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Material(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: sneaker.color,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.favorite_outline,
                    color: sneaker.estimatedColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
