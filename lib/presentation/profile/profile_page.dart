import 'package:flutter/material.dart';
import 'package:sneakers/presentation/widgets/empty_page.dart';

class ProfilePage extends EmptyPage {
  const ProfilePage({super.key})
      : super(
          icon: Icons.person_outlined,
          title: 'Profile',
        );

  static const routeName = '/profile';
}
