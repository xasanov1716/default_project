import 'package:api_default_project/bloc/user_multi_state/user_event.dart';
import 'package:api_default_project/bloc/user_multi_state/user_state.dart';
import 'package:bloc/bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/repositories.dart';
import '../user/user_state.dart';


class MultiBloc extends Bloc<MultiUserEvent, UserMultiState> {
  MultiBloc({required this.userRepository}) : super(UserInitial()) {
    on<AddUserMultiState>(_addUser);
    on<GetUsersMultiState>(_getUsers);
    on<DeleteUserMultiState>(_deleteUser);
    on<UpdateUserMultiState>(_updateUser);
  }

  final UserRepository userRepository;

  List<UserModel> users=[];

   _addUser(AddUserMultiState event,Emitter<UserMultiState> emit)async{
    emit(UserLoadingState());
    try{
      await userRepository.addUser(userModel: event.userModel);
      emit(UserAddSuccessState());
    }catch(e){
      emit(UserErrorState(errorText: e.toString()));
    }

  }

   _getUsers(GetUsersMultiState event,Emitter<UserMultiState> emit)async{
    emit(UserLoadingState());
    try{
      users=await userRepository.getUsers();
      emit(UserSuccessState());
    }catch (e){
      emit(UserErrorState(errorText: e.toString()));
    }
  }

   _deleteUser(DeleteUserMultiState event,Emitter<UserMultiState> emit)async{
    emit(UserLoadingState());
    try{
      await userRepository.deleteUser(id: event.id);
      await userRepository.getUsers();
      emit(UserDeleteSuccessState());
    }catch (e){
      emit(UserErrorState(errorText: e.toString()));
    }

  }

   _updateUser(UpdateUserMultiState event, Emitter<UserMultiState> emit)async{
    emit(UserLoadingState());
    try{
      await userRepository.updateUser(userModel: event.newUserModel);
      await userRepository.getUsers();
      emit(UserUpdateSuccessState());
    }catch (e){
      emit(UserErrorState(errorText: e.toString()));
    }

  }
}
