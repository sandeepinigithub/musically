import 'package:musically/core/enum/player_state.dart';
import 'package:musically/core/enum/view_state.dart';
import 'package:musically/core/viewmodel/base_model.dart';
import 'package:musically/ui/locator.dart';

import 'music_model.dart';

class TabProvider extends BaseModel {
  int _currentTab = 1;

  int get getCurrentTab => _currentTab;

  setCurrentTab(int value) {
    state = ViewState.Busy;
    _currentTab = value;
    state = ViewState.Idle;
  }
}

