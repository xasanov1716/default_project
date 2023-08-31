part of 'music_bloc.dart';

@immutable
abstract class MusicEvent {}


class PlayMusicEevent extends MusicEvent{

}

class PauseMusicEevent extends MusicEvent{}

class StopMusicEevent extends MusicEvent{}

class AddMusicEevent extends MusicEvent{
  final String url;
  AddMusicEevent({required this.url});
}



