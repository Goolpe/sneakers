import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/core/routes/routes.dart';
import 'package:sneakers/core/theme/custom_theme_data.dart';
import 'package:sneakers/presentation/bag/cubit/bag_cubit.dart';
import 'package:sneakers/presentation/home/cubit/brand_cubit.dart';
import 'package:sneakers/presentation/home/cubit/sneaker_type_cubit.dart';
import 'package:sneakers/presentation/main/cubit/page_cubit.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => BrandCubit(),
        ),
        BlocProvider(
          create: (context) => SneakerTypeCubit(),
        ),
        BlocProvider(
          create: (context) => BagCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerate,
        theme: CustomThemeData.light,
      ),
    );
  }
}
