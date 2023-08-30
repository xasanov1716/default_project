import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';



abstract class MultiUserEvent extends Equatable{}

class AddUserMultiState extends MultiUserEvent{
  final UserModel userModel;
  AddUserMultiState({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class GetUsersMultiState extends MultiUserEvent{
  @override
  List<Object?> get props => [];
}

class UpdateUserMultiState extends MultiUserEvent{
  final UserModel newUserModel;
  UpdateUserMultiState({required this.newUserModel});

  @override
  List<Object?> get props=> [newUserModel];
}

class DeleteUserMultiState extends MultiUserEvent{
  final int id;
  DeleteUserMultiState({required this.id});
  @override
  List<Object?> get props=> [id];

}