import 'package:api_default_project/cubits/pow/pow_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class PowCubit extends Cubit<PowState> {
  PowCubit() : super(PowState());

  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();

  void initialA(double a) {
    emit(state.copyWith(a:a));
  }

  void initialB(double b) {
    emit(state.copyWith(b: b));
  }

  void getPow() {
    emit(state.copyWith(result: math.pow(state.a, state.b).toString()));
  }
}
