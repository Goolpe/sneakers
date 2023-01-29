import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/domain/entities/bag_sneaker.dart';
import 'package:sneakers/domain/entities/sneaker.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class BagCubit extends Cubit<List<BagSneaker>> {
  BagCubit() : super([]);

  final _latestSneakers = <BagSneaker>[];

  List<BagSneaker> latestSneakers() {
    var result = <BagSneaker>[];

    if (_latestSneakers.isNotEmpty) {
      result = List<BagSneaker>.from(_latestSneakers.reversed);
      _latestSneakers.clear();

      emit(List<BagSneaker>.from([...result, ...state]));
    }

    return result;
  }

  void add(Sneaker sneaker) {
    final bagSneaker = state.firstWhereOrNull(
      (element) => element.id == sneaker.id,
    );

    if (bagSneaker != null) {
      if (bagSneaker.count < 20) {
        bagSneaker.count += 1;
      }
    } else {
      _latestSneakers.add(
        BagSneaker(
          id: sneaker.id,
          count: 1,
          name: sneaker.name,
          image: sneaker.image,
          price: sneaker.price,
        ),
      );
    }
  }

  void addOne(int id) {
    final bagSneaker = state.firstWhereOrNull(
      (element) => element.id == id,
    );

    if (bagSneaker != null && bagSneaker.count < 20) {
      bagSneaker.count += 1;

      emit(List<BagSneaker>.from(state));
    }
  }

  void removeOne(int id) {
    final bagSneaker = state.firstWhereOrNull(
      (element) => element.id == id,
    );

    if (bagSneaker != null) {
      if (bagSneaker.count == 1) {
        state.remove(bagSneaker);
      } else {
        bagSneaker.count -= 1;
      }
    }

    emit(List<BagSneaker>.from(state));
  }
}
