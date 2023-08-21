import 'package:api_default_project/cubits/button_cubit/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState>{
  ButtonCubit(): super(ButtonState());
  
  
  getBool(bool onTab){
    emit(state.copyWith(onChanged: onTab));
  }
}