import 'package:sneakers/core/utils/double.dart';

class BagSneaker {
  BagSneaker({
    required this.id,
    required this.count,
    required this.name,
    required this.image,
    required this.price,
  });

  final int id;
  final int count;
  final String name;
  final String image;
  final double price;

  double get total => price * count;

  String get totalAsCurrency => total.toCurrency();

  BagSneaker copyWith({
    int? id,
    int? count,
    String? name,
    String? image,
    double? price,
  }){
    return BagSneaker(
      id: id ?? this.id,
      count: count ?? this.count,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}

class BagDetails {
  BagDetails({
    this.totalCount = 0,
    this.totalSum = 0,
  });

  final int totalCount;
  final double totalSum;

  String get totalSumAsCurrency => totalSum.toCurrency();

  BagDetails copyWith({
    int? totalCount,
    double? totalSum,
  }){
    return BagDetails(
      totalCount: totalCount ?? this.totalCount,
      totalSum: totalSum ?? this.totalSum,
    );
  }
}
