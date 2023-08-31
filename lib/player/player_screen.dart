import 'package:api_default_project/player/widgets/volume_changer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'all_audios_screen.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key, required this.name, required this.music, required this.image, required this.index}) : super(key: key);


  final List<String> name;
  final List<String> music;
  final  List<String> image;
  final int index;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;
  double volume = 0.3;
  late int index;
  Duration duration = Duration.zero;
  Duration currentDuration = Duration.zero;
  String songUrl = "";

  _init() async {
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = Duration.zero;
        currentDuration = Duration.zero;
      });
      print("SONG COMPLETED");
    });

    player.onPositionChanged.listen((Duration d) {
      currentDuration = d;
      setState(() {});
      print("DURATION: ${d.inSeconds}");
    });
  }

  _next(){
    if(widget.music.length-1>widget.index){
     index = widget.index + 1;
    }else{
      index=0;
    }
    player.stop();
    player.play(AssetSource(widget.music[index]));
    isPlaying=true;
    setState(() {});
  }
  _back(){
    if(0<index){
      index =  widget.index - 1;
    }else{
      index=widget.music.length-1;
    }
    player.stop();
    player.play(AssetSource(widget.music[index]));
    isPlaying=true;
    setState(() {});
  }

  @override
  void initState() {
    index = widget.index;
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          player.dispose();
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: const Text("Player screen",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(widget.image[index]),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.all(26),
                width: double.infinity,
                child:Center(child: Text(widget.name[index],style: TextStyle(fontSize: 26,color: Colors.white),)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Container(padding: EdgeInsets.all(10),child: Center(child: Text('${currentDuration.inSeconds ~/ 60}: ${currentDuration.inSeconds % 60}')),decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.grey),),
                  const Spacer(),
                  Container(padding: EdgeInsets.all(10),child: Center(child: Text('${duration.inSeconds ~/ 60}: ${duration.inSeconds % 60}')),decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.grey),),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Slider(
                  inactiveColor: Colors.black,
                  value: currentDuration.inSeconds.toDouble(),
                  max: duration.inSeconds.toDouble(),
                  activeColor: Colors.white,

                  onChanged: (double value) async {
                    await player.seek(Duration(seconds: value.toInt()));
                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colors.grey
                ),
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ZoomTapAnimation(child: const Icon(Icons.skip_previous,size: 50,),onTap: (){
                      setState(() {
                        if (index != 0) {
                          index -= 1;
                          isPlaying = false;
                          currentDuration = Duration.zero;
                          player.stop();
                          _init();
                        }
                      });
                    },),
                    ZoomTapAnimation(child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 50,
                    ),onTap: (){
                      setState(() {
                        if (!isPlaying) {
                          player.play(AssetSource(widget.music[index]));
                          isPlaying = true;
                        } else {
                          player.pause();
                          isPlaying = false;
                        }
                      });
                    },),
                    ZoomTapAnimation(child: Icon(Icons.skip_next,size: 50,),onTap: (){
                      setState(() {
                        if (index != 0) {
                          index -= 1;
                          isPlaying = false;
                          player.stop();
                          _init();
                        }
                      });
                    },),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
