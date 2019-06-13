import 'package:musically/core/enum/player_state.dart';
import 'package:musically/core/enum/view_state.dart';

import 'base_model.dart';
import 'package:flute_music_player/flute_music_player.dart';

class MusicModel extends BaseModel {
  List<Song> _songs;
  MusicFinder audioPlayer;
  PlayerState _playerState;

  PlayerState get playerState => _playerState;

  set playerState(PlayerState value) {
    state = ViewState.Busy;
    _playerState = value;
    state = ViewState.Idle;
  }

  set songs(value) {
    state = ViewState.Busy;
    _songs = value;
    state = ViewState.Idle;
  }

  get songs => _songs;

  void initPlayer() async {
    state = ViewState.Busy;
    audioPlayer = MusicFinder();
    List<Song> songs = await MusicFinder.allSongs();
    songs = List.from(songs);
    _songs = songs;
    state = ViewState.Idle;
  }
}
