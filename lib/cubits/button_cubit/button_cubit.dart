import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_state.dart';

class ButtonCubit extends Cubit<TaskState> {
  ButtonCubit() : super(TaskState(currentState: false));

  List<int> indexes=[];

  changeState(int index) {
    if(indexes.contains(index)){
      indexes.remove(index);
    }else{
      indexes.add(index);
    }

    emit(
      state.copyWith(currentState: !state.currentState),
    );
  }
}