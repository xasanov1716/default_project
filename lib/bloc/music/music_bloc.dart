import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'music_event.dart';

part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc() : super(MusicInitial()) {
    on<PlayMusicEevent>(_playMusic);
    on<PauseMusicEevent>(_pauseMusic);
    on<StopMusicEevent>(_stopMusic);
    // on<AddMusicEevent>(_addMusic);
  }

  final player = AudioPlayer();
  bool isPlaying = false;
  String url = '';

  _playMusic(PlayMusicEevent event, Emitter<MusicState> emit) async {
    if (url.isNotEmpty) {
      await player.setSourceUrl(url);
      emit(MusicSuccesState());
    } else {
      emit(MusicErrorState(errorText: 'ERROR'));
    }
  }

  _pauseMusic(PauseMusicEevent event, Emitter emit) {
    if (!isPlaying) {
      player.pause();
      emit(MusicSuccesState());
    }else{
      emit(MusicErrorState(errorText: 'ERROR'));
    }
  }

  _stopMusic(StopMusicEevent event,Emitter emit){
    try{
    player.stop();
      emit(MusicSuccesState());
    }
    catch(e){
      emit(MusicErrorState(errorText: e.toString()));
    }
  }

}
