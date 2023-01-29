import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/domain/entities/sneaker.dart';
import 'package:sneakers/presentation/bag/cubit/bag_cubit.dart';
import 'package:sneakers/presentation/sneaker_details/widgets/assets_component.dart';
import 'package:sneakers/presentation/sneaker_details/widgets/description_component.dart';
import 'package:sneakers/presentation/sneaker_details/widgets/sizes_somponent.dart';
import 'package:sneakers/presentation/sneaker_details/widgets/sneaker_details_app_bar.dart';
import 'package:sneakers/presentation/widgets/large_title.dart';
import 'package:sneakers/presentation/widgets/primary_button.dart';

class SneakerDetailsPage extends StatefulWidget {
  const SneakerDetailsPage({required this.sneaker, super.key});

  final Sneaker sneaker;

  static const routeName = 'sneacker-detail';

  @override
  State<SneakerDetailsPage> createState() => _SneakerDetailsPageState();
}

class _SneakerDetailsPageState extends State<SneakerDetailsPage> {
  bool _visible = false;
  static const _duration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    Future.delayed(_duration, () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SneakerDetailsAppBar(sneaker: widget.sneaker),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        _AnimatedVisibility(
                          visible: _visible,
                          duration: _duration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AssetsComponent(assets: widget.sneaker.assets),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(thickness: 3),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    LargeTitle(widget.sneaker.name),
                                    LargeTitle(widget.sneaker.priceAsCurrency),
                                  ],
                                ),
                              ),
                              DescriptionComponent(
                                description: widget.sneaker.description,
                              ),
                              const SizedBox(height: 24),
                              SizesComponent(sizes: widget.sneaker.sizes),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _AnimatedVisibility(
              visible: _visible,
              duration: _duration,
              child: PrimaryButton(
                onPressed: () => context.read<BagCubit>().add(widget.sneaker),
                title: 'Add to bag',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedVisibility extends StatelessWidget {
  const _AnimatedVisibility({
    required this.visible,
    required this.duration,
    required this.child,
  });

  final bool visible;
  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(top: visible ? 0 : 50),
      duration: duration,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: duration,
        child: child,
      ),
    );
  }
}
