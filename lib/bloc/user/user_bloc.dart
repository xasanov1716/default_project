import 'package:api_default_project/bloc/user/user_event.dart';
import 'package:api_default_project/bloc/user/user_state.dart';
import 'package:api_default_project/data/models/form_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';

class UserBloc extends Bloc<UsersEvent, UserState> {
  UserBloc()
      : super(
            const UserState(status: FormStatus.pure, errorText: '', user: [])){
    on<AddUser>(_addUser);
    on<GetUser>(_getUser);
    on<UpdateUser>(_updateUser);
  }



  _addUser(AddUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    if (event.userModel.toString().isNotEmpty) {
      emit(state.copyWith(
          status: FormStatus.success,
          user: [...state.user, event.userModel],
          errorText: 'User Added'));
    }else{
      emit(state.copyWith(status: FormStatus.failure,errorText: 'ERROR'));
    }
  }

  _getUser(GetUser event,Emitter<UserState> emit)async{
    emit(state.copyWith(status: FormStatus.loading,errorText: 'Getting user'));
    if(state.user.isNotEmpty){
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: FormStatus.success,errorText: 'Get User',user: [...state.user]));
    }else{
      emit(state.copyWith(status: FormStatus.failure,errorText: 'ERROR'));
    }
  }


  _updateUser(UpdateUser event, Emitter emit)async{
    emit(state.copyWith(status: FormStatus.loading,errorText: 'Updating User'));
    List<UserModel> currentUsers = state.user;
    if(event.updateUser.toString().isNotEmpty){
      await Future.delayed(const Duration(seconds: 2));
      for (int i = 0; i < currentUsers.length; i++) {
        if (event.updateUser.id == currentUsers[i].id) {
          currentUsers[i] = event.updateUser;
        }
      }
      emit(state.copyWith(status: FormStatus.success,user: currentUsers));
    }else{
      emit(state.copyWith(status: FormStatus.failure,errorText: 'ERROR'));
    }
  }



}
