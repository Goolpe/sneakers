import 'package:sneakers/domain/entities/sneaker.dart';

class Brand {
  const Brand({
    required this.id,
    required this.name,
    this.upcoming = const [],
    this.featured = const [],
    this.newModels = const [],
  });

  final int id;
  final String name;
  final List<Sneaker> upcoming;
  final List<Sneaker> featured;
  final List<Sneaker> newModels;

  List<Sneaker> sneakersByType(SneakerType type) {
    switch (type) {
      case SneakerType.featured:
        return featured;
      case SneakerType.upcoming:
        return upcoming;
      case SneakerType.newModel:
        return newModels;
      default:
        return [];
    }
  }
}
