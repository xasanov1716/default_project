import 'package:api_default_project/data/models/form_status.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class UserSingleState extends Equatable {
  final FormStatus status;
  final String errorText;
  final List<UserModel> user;

  const UserSingleState(
      {required this.status, required this.errorText, required this.user});

  @override
  List<Object?> get props => [errorText, user, status];

  UserSingleState copyWith({
    FormStatus? status,
    String? errorText,
    List<UserModel>? user,
  }) =>
      UserSingleState(
          status: status ?? this.status,
          errorText: errorText ?? this.errorText,
          user: user ?? this.user);
}
