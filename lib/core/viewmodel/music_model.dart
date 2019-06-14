import 'package:musically/core/enum/player_state.dart';
import 'package:musically/core/enum/view_state.dart';
import 'package:musically/ui/locator.dart';
import 'base_model.dart';
import 'package:flute_music_player/flute_music_player.dart';

class MusicModel extends BaseModel {
  List<Song> _songs;
  MusicFinder audioPlayer;
  PlayerProvider playerprovider = locator<PlayerProvider>();

  set songs(value) {
    state = ViewState.Busy;
    _songs = value;
    state = ViewState.Idle;
  }

  get songs => _songs;

  initPlayer() async {
    state = ViewState.Busy;
    audioPlayer = MusicFinder();
    List<Song> songs = await MusicFinder.allSongs();
    songs = List.from(songs);
    _songs = songs;
    state = ViewState.Idle;
  }

  void play(String url, int index) async {
    stop().then((_) {
      var result = audioPlayer.play(url, isLocal: true);
      playerprovider.playingState = PlayerState.playing;
      result.then((_) {
        playerprovider.currentSong = _songs[index].title;
        audioPlayer.setCompletionHandler(() {
          playerprovider.currentSong = '';
          playerprovider.playingState = PlayerState.stopped;
        });
      });
    });
  }

  Future<void> stop() async {
    playerprovider._playingState = PlayerState.stopped;
    playerprovider.currentSong = '';
    return audioPlayer.stop();
  }

  Future<void> pause() async {
    return audioPlayer.pause();
  }
}

class PlayerProvider extends BaseModel {
  double _currentTime = 0.0;
  String _currentSong;

  String get currentSong => _currentSong;

  set currentSong(String value) {
    _currentSong = value;
    notifyListeners();
  }

  get currentTime => _currentTime;

  set currentTime(value) {
    _currentTime = value;
    notifyListeners();
  }

  PlayerState _playingState = PlayerState.stopped;

  PlayerState get playingState => _playingState;

  set playingState(PlayerState value) {
    _playingState = value;
    state = ViewState.Idle;
  }
}
