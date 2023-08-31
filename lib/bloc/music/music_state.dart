part of 'music_bloc.dart';

@immutable
abstract class MusicState {}

class MusicInitial extends MusicState {}

class MusicLoadingState extends MusicState {}

class MusicErrorState extends MusicState {
  final String errorText;

  MusicErrorState({required this.errorText});
}

class MusicSuccesState extends MusicState {
  MusicSuccesState();

}


