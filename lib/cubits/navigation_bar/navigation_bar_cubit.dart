import 'package:api_default_project/cubits/navigation_bar/navigation_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarCubit extends Cubit<TabState> {
  NavigationBarCubit() : super(PowScreenState());

  int currentIndex = 0;

  updateScreen({required int index}) {

    if (index == 0) {
      currentIndex = index;
      emit(PowScreenState());
    } else {
      currentIndex = index;
      emit(AuthScreenState());
    }
  }
}