

import 'package:api_default_project/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {}

class AddUser extends UsersEvent{


  AddUser({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}


class GetUser extends UsersEvent{


  @override
  List<Object?> get props => [];
}

class UpdateUser extends UsersEvent{

  UpdateUser({required this.updateUser});

  final UserModel updateUser;

  @override
  List<Object?> get props => [updateUser];
}


class DeleteUser extends UsersEvent{

  DeleteUser({required this.userId});

  final int userId;

  @override
  List<Object?> get props => [userId];
}