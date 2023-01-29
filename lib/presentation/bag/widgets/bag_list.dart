import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/domain/entities/bag_sneaker.dart';
import 'package:sneakers/presentation/bag/cubit/bag_cubit.dart';
import 'package:sneakers/presentation/bag/widgets/bag_sneaker_card.dart';
import 'package:sneakers/presentation/widgets/empty_page.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class BagList extends StatefulWidget {
  const BagList({
    required this.sneakers,
    super.key,
  });

  final List<BagSneaker> sneakers;

  @override
  State<BagList> createState() => _BagListState();
}

class _BagListState extends State<BagList> {
  List<BagSneaker> _sneakers = [];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _sneakers = List.from(widget.sneakers);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final latestSneakers = context.read<BagCubit>().latestSneakers();

      for (var sneaker in latestSneakers.reversed) {
        await Future.delayed(const Duration(milliseconds: 300), () {
          _sneakers.insert(0, sneaker);
          _listKey.currentState
              ?.insertItem(0, duration: const Duration(milliseconds: 200));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sneakers.isEmpty) {
      return const EmptyPage(
        icon: Icons.shopping_cart_outlined,
        title: 'No shoes added',
      );
    }

    return AnimatedList(
      key: _listKey,
      physics: const BouncingScrollPhysics(),
      initialItemCount: _sneakers.length,
      itemBuilder: (context, index, animation) {
        final bagSneaker = _sneakers[index];

        return _buildItem(
          bagSneaker,
          animation,
          onAdd: () {
            context.read<BagCubit>().addOne(bagSneaker.id);
          },
          onDelete: () {
            context.read<BagCubit>().removeOne(bagSneaker.id);

            final sneaker = widget.sneakers.firstWhereOrNull(
              (element) => element.id == bagSneaker.id,
            );

            if (sneaker == null) {
              _sneakers.removeAt(index);

              AnimatedList.of(context).removeItem(
                index,
                (context, animation) => _buildItem(bagSneaker, animation),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildItem(
    BagSneaker bagSneaker,
    Animation<double> animation, {
    Function()? onDelete,
    Function()? onAdd,
  }) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: BagSneakerCard(
          key: Key('${bagSneaker.id}item'),
          bagSneaker: bagSneaker,
          animation: animation,
          onDelete: onDelete,
          onAdd: onAdd,
        ),
      ),
    );
  }
}
