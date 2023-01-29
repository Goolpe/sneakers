import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/domain/entities/bag_sneaker.dart';
import 'package:sneakers/presentation/bag/cubit/bag_cubit.dart';
import 'package:sneakers/presentation/bag/widgets/bag_list.dart';
import 'package:sneakers/presentation/main/navigation_page.dart';
import 'package:sneakers/presentation/widgets/primary_button.dart';
import 'package:sneakers/presentation/widgets/sneaker_app_bar.dart';

class BagPage extends NavigationPage {
  const BagPage({super.key}) : super(icon: Icons.shopping_cart_outlined);

  static const routeName = '/bag';

  BagDetails _sneakersDetails(List<BagSneaker> sneakers) {
    var bagDetails = BagDetails();
    for (var sneaker in sneakers) {
      bagDetails.totalCount += sneaker.count;
      bagDetails.totalSum += sneaker.price * sneaker.count;
    }
    return bagDetails;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, List<BagSneaker>>(
      builder: (context, sneakers) {
        final details = _sneakersDetails(sneakers);

        return Scaffold(
          appBar: SneakerAppBar(
            height: 120,
            elevation: 2,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            subtitle: 'My Bag',
            subactions: [
              Text(
                'Total ${details.totalCount} items',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: BagList(sneakers: sneakers),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Divider(height: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('TOTAL'),
                          Text(
                            details.totalSumAsCurrency,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PrimaryButton(
                      onPressed: () {},
                      title: 'Next',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
