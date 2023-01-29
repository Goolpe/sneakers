import 'dart:ui';

import 'package:sneakers/core/theme/colors.dart';
import 'package:sneakers/core/utils/double.dart';
import 'package:sneakers/domain/entities/asset.dart';

class Sneaker {
  const Sneaker({
    required this.id,
    required this.shortName,
    required this.name,
    required this.brandName,
    required this.price,
    required this.assets,
    required this.type,
    required this.color,
    required this.description,
    required this.sizes,
  });

  final int id;
  final String shortName;
  final String name;
  final String brandName;
  final double price;
  final List<Asset> assets;
  final SneakerType type;
  final Color color;
  final String description;
  final List<double> sizes;

  String get priceAsCurrency => price.toCurrency();

  String get image => assets[0].path;

  Color get estimatedColor => color.estimate();
}

enum SneakerType {
  upcoming,
  featured,
  newModel,
  other,
}

extension SneakerTypeExt on SneakerType {
  String get name {
    switch (this) {
      case SneakerType.upcoming:
        return 'Upcoming';
      case SneakerType.featured:
        return 'Featured';
      case SneakerType.newModel:
        return 'New';
      default:
        return 'other';
    }
  }
}
