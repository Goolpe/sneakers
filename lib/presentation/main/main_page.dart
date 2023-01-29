import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/presentation/main/cubit/page_cubit.dart';

import 'package:sneakers/presentation/bag/bag_page.dart';
import 'package:sneakers/presentation/favorites/favorites_page.dart';
import 'package:sneakers/presentation/home/home_page.dart';
import 'package:sneakers/presentation/map/map_page.dart';
import 'package:sneakers/presentation/profile/profile_page.dart';
import 'package:sneakers/presentation/widgets/sneaker_app_bar.dart';
import 'package:sneakers/presentation/widgets/square_icon_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = '/';

  static const pages = [
    HomePage(),
    FavoritesPage(),
    MapPage(),
    BagPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: const SneakerAppBar(
            subtitle: 'Discover',
            subactions: [
              SquareIconButton(
                iconSize: 30,
                icon: Icons.search,
              ),
              SizedBox(width: 12),
              SquareIconButton(
                iconSize: 30,
                icon: Icons.notifications_outlined,
              ),
            ],
          ),
          body: pages[state],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (value) {
              if (pages[value] is BagPage) {
                Navigator.pushNamed(context, BagPage.routeName);
              } else {
                context.read<PageCubit>().updateIndex(value);
              }
            },
            items: [
              for (var page in pages)
                BottomNavigationBarItem(
                  icon: Icon(page.icon),
                  label: '',
                ),
            ],
          ),
        );
      },
    );
  }
}
