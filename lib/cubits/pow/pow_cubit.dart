import 'package:api_default_project/cubits/pow/pow_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class PowCubit extends Cubit<PowState> {
  PowCubit() : super(PowState());

  void getPow({required int a,required int b}) {
    emit(state.copyWith(result: math.pow(a, b).toInt()));
  }
}
