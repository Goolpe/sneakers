import 'package:flutter_bloc/flutter_bloc.dart';

class BrandCubit extends Cubit<int> {
  BrandCubit() : super(0);

  void updateIndex(value) => emit(value);
}
