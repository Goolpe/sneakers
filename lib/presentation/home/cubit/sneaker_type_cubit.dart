import 'package:flutter_bloc/flutter_bloc.dart';

class SneakerTypeCubit extends Cubit<int> {
  SneakerTypeCubit() : super(1);

  void updateIndex(value) => emit(value);
}
