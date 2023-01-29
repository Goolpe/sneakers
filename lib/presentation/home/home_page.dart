import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/domain/mock_sneakers.dart';
import 'package:sneakers/presentation/home/cubit/brand_cubit.dart';
import 'package:sneakers/presentation/home/more_content.dart';
import 'package:sneakers/presentation/home/sneakers_content.dart';
import 'package:sneakers/presentation/main/navigation_page.dart';

class HomePage extends NavigationPage {
  const HomePage({super.key}) : super(icon: Icons.home_outlined);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, int>(
      builder: (context, activeBrandIndex) {
        return DefaultTabController(
          length: mockSneakers.brands.length,
          child: ListView(
            children: [
              TabBar(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                isScrollable: true,
                onTap: context.read<BrandCubit>().updateIndex,
                indicatorColor: Colors.transparent,
                tabs: [
                  for (var i = 0; i < mockSneakers.brands.length; i++)
                    Tab(
                      child: Text(
                        mockSneakers.brands[i].name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: i == activeBrandIndex
                              ? Colors.black
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 350,
                child: SneakersContent(
                  brand: mockSneakers.brands[activeBrandIndex],
                ),
              ),
              MoreContent(
                sneakers: mockSneakers.more,
              ),
            ],
          ),
        );
      },
    );
  }
}
