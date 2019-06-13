import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:musically/core/viewmodel/TabProvider.dart';
import 'package:musically/core/enum/player_state.dart';
import 'package:musically/core/enum/view_state.dart';
import 'package:musically/core/viewmodel/music_model.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import '../locator.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  MusicModel model;
  final isPlaying = locator<PlayerProvider>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = locator<MusicModel>();
    model.initPlayer();
  }

  void playLocal(String url) async {
    stop();
    model.playerState == PlayerState.stopped ? play(url) : stop();
  }

  void play(String url) async {
    await model.audioPlayer.play(url, isLocal: true);
    model.playerState = PlayerState.playing;
//    isPlaying.play = true;
  }

  void stop() async {
    await model.audioPlayer.stop();
    model.playerState = PlayerState.stopped;
//    isPlaying.play = false;
  }

  @override
  Widget build(BuildContext context) {
    return (model.state == ViewState.Busy || model.songs == null)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: model.songs.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
//                  child: Image.network(model.songs[index].albumArt),
                    ),
                title: Text(model.songs[index].title),
                onTap: () => playLocal(model.songs[index].uri),
              );
            });
  }
}
