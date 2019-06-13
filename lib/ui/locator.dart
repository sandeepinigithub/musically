import 'package:get_it/get_it.dart';
import 'package:musically/core/viewmodel/TabProvider.dart';
import 'package:musically/core/viewmodel/base_model.dart';
import 'package:musically/core/viewmodel/homeviewmodel.dart';
import 'package:musically/core/viewmodel/music_model.dart';
import 'package:musically/core/viewmodel/search_model.dart';
import 'package:musically/core/viewmodel/settings_model.dart';

GetIt locator = GetIt();

void setLocator() {
  //view models
  locator.registerLazySingleton(() => MusicModel());
  locator.registerLazySingleton(() => HomeModel());
  locator.registerLazySingleton(() => SearchModel());
  locator.registerLazySingleton(() => SettingsModel());
  locator.registerLazySingleton(() => BaseModel());

  //custom provider for specific purpose
  locator.registerLazySingleton(() => PlayerProvider());
  locator.registerLazySingleton(() => TabProvider());
}
