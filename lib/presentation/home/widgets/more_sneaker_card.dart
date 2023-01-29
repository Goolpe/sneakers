import 'package:flutter/material.dart';
import 'package:sneakers/domain/entities/sneaker.dart';
import 'package:sneakers/presentation/sneaker_details/sneaker_details_page.dart';

class MoreSneakerCard extends StatelessWidget {
  const MoreSneakerCard({
    required this.sneaker,
    super.key,
  });

  final Sneaker sneaker;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(
          context,
          SneakerDetailsPage.routeName,
          arguments: sneaker,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Container(
              height: 220,
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 100,
                    color: Colors.grey[300] ?? Colors.grey,
                  )
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Expanded(child: Image.asset(sneaker.image)),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          '${sneaker.brandName} ${sneaker.shortName}'
                              .toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(sneaker.priceAsCurrency),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.favorite_outline),
                  onPressed: () {},
                ),
              ),
            ),
            Positioned(
              left: 10,
              child: Container(
                height: 88,
                width: 24,
                color: Colors.pink,
                alignment: Alignment.center,
                child: const RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
