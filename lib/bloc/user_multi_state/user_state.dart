
import 'package:equatable/equatable.dart';



abstract class UserMultiState extends Equatable {}

class UserInitial extends UserMultiState {
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserMultiState{
  @override
  List<Object?> get props=> [];
}

class UserErrorState extends UserMultiState{
  final String errorText;
  UserErrorState({required this.errorText});
  @override
  List<Object?> get props=> [errorText];
}
class UserSuccessState extends UserMultiState{
  @override
  List<Object?> get props=> [];
}

class UserAddSuccessState extends UserMultiState{
  @override
  List<Object?> get props=> [];
}
class UserDeleteSuccessState extends UserMultiState{
  @override
  List<Object?> get props=> [];
}
class UserUpdateSuccessState extends UserMultiState{
  @override
  List<Object?> get props=> [];
}