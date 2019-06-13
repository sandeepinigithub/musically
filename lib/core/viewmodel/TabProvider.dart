import 'package:musically/core/enum/player_state.dart';
import 'package:musically/core/enum/view_state.dart';
import 'package:musically/core/viewmodel/base_model.dart';

class TabProvider extends BaseModel {
  int _currentTab = 1;

  int get getCurrentTab => _currentTab;

  setCurrentTab(int value) {
    state=ViewState.Busy;
    _currentTab = value;
    state = ViewState.Idle;
  }
}

class PlayerProvider extends BaseModel {
  PlayerState _playingState = PlayerState.stopped;

  PlayerState get playingState => _playingState;

  set playingState(PlayerState value) {
    _playingState = value;
    state = ViewState.Idle;
  }
}
