import 'package:flutter/material.dart';
import 'package:sneakers/presentation/widgets/empty_page.dart';

class FavoritesPage extends EmptyPage {
  const FavoritesPage({super.key})
      : super(
          icon: Icons.favorite_outline,
          title: 'Favorites',
        );

  static const routeName = '/favorites';
}
