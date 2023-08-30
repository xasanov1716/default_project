import 'package:api_default_project/bloc/user/user_event.dart';
import 'package:api_default_project/bloc/user/user_state.dart';
import 'package:api_default_project/data/models/form_status.dart';
import 'package:api_default_project/data/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';

class UserBloc extends Bloc<UsersEvent, UserSingleState> {
  UserBloc({required this.userRepository})
      : super(
            const UserSingleState(status: FormStatus.pure, errorText: '', user: [])) {
    on<AddUser>(_addUser);
    on<GetUser>(_getUser);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  UserRepository userRepository;

  _addUser(AddUser event, Emitter<UserSingleState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    Future.delayed(const Duration(seconds: 3));
    try{
      await userRepository.addUser(userModel: event.userModel);
      emit(state.copyWith(
          status: FormStatus.success,
          user: [...state.user, event.userModel],
          errorText: 'User Added'));
    }
    catch(e) {
      emit(state.copyWith(status: FormStatus.failure, errorText: e.toString()));
    }
  }

  _getUser(GetUser event, Emitter<UserSingleState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, errorText: 'Getting user'));
    Future.delayed(const Duration(seconds: 3));
    try{
      await userRepository.getUsers();
      emit(state.copyWith(
          status: FormStatus.success,
          errorText: 'Get User',
          user: [...state.user]));

    }
    catch(e){
      emit(state.copyWith(status: FormStatus.failure, errorText: e.toString()));
    }
  }

  _updateUser(UpdateUser event, Emitter emit) async {
    emit(
        state.copyWith(status: FormStatus.loading, errorText: 'Updating User'));
    try {
      await Future.delayed(const Duration(seconds: 2));
      await userRepository.updateUser(userModel: event.updateUser);
      emit(state.copyWith(status: FormStatus.success));
    }
    catch(e){
      emit(state.copyWith(status: FormStatus.failure, errorText: e.toString()));
    }
  }

  _deleteUser(DeleteUser event, Emitter<UserSingleState> emit) async {
    emit(
        state.copyWith(status: FormStatus.loading, errorText: 'Deleting User'));
    await Future.delayed(const Duration(seconds: 2));
    try{
      await userRepository.deleteUser(id: event.userId);
      await userRepository.getUsers();
      emit(state.copyWith(status: FormStatus.success));

    }
    catch(e){
      emit(state.copyWith(status: FormStatus.failure,errorText: e.toString()));
    }
  }
}
