import 'package:flutter/material.dart';
import 'package:musically/core/enum/player_state.dart';
import 'package:musically/core/viewmodel/TabProvider.dart';
import 'package:musically/core/viewmodel/music_model.dart';
import 'package:musically/ui/shared/color_styles.dart';
import 'package:musically/ui/views/Music.dart';
import 'package:musically/ui/views/Home.dart';
import 'package:musically/ui/widgets/base_view.dart';
import '../SampleData.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _children = [Home(), Music()];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Size size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    return BaseView<TabProvider>(
        builder: (context, tab, _) => BaseView<PlayerProvider>(
            builder: (context, playprovider, _) => Scaffold(
                  body: _children[tab.getCurrentTab],
                  backgroundColor: Colors.white,
                  bottomNavigationBar: Container(
                    height: size.height / 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              color: ColorStyle.gray,
                              height: size.height / 19,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      width: size.height / 18,
                                      height: size.height / 18,
                                      child: Image.asset(
                                        Data.imageSet[1],
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.cover,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        playprovider.currentSong == null
                                            ? Text('')
                                            : Text(playprovider.currentSong),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                width: size.width,
                                height: 6.0,
                                child: LinearProgressIndicator(
                                  value: playprovider.currentTime,
                                  backgroundColor: ColorStyle.gray,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      ColorStyle.red),
                                )),
                          ],
                        ),
                        BottomNavigationBar(
                          showUnselectedLabels: true,
                          elevation: 0.0,
                          type: BottomNavigationBarType.fixed,
                          onTap: (index) {
                            if (index < 2)
                              tab.setCurrentTab(index);
                            else if (index == 2) {
                              playprovider.playingState == PlayerState.playing
                                  ? playprovider.playingState =
                                      PlayerState.paused
                                  : playprovider.playingState =
                                      PlayerState.playing;
                            } else if (index > 2) {
                              if (index == 3) {
                                Navigator.of(context).pushNamed('/search');
                              } else if (index == 4) {
                                Navigator.pushNamed(context, '/setting');
                              }
                            }
                          },
                          backgroundColor: Colors.transparent,
                          selectedItemColor: ColorStyle.red,
                          unselectedItemColor: ColorStyle.gray,
                          items: [
                            BottomNavigationBarItem(
                                backgroundColor: Colors.white,
                                icon: Icon(
                                  Icons.home,
                                  size: width / 16,
                                ),
                                title: Text(
                                  'Home',
                                )),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.library_music,
                                  size: width / 16,
                                ),
                                title: Text(
                                  'Music',
                                )),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  playprovider.playingState ==
                                              PlayerState.paused ||
                                          playprovider.playingState ==
                                              PlayerState.stopped
                                      ? Icons.play_circle_filled


                                      : Icons.pause_circle_filled,
                                  size: width / 8,
                                  color: ColorStyle.red,
                                ),
                                title: Container(
                                  height: 4.0,
                                )),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.search,
                                  size: width / 16,
                                ),
                                title: Text(
                                  'Search',
                                )),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.settings,
                                  size: width / 16,
                                ),
                                title: Text(
                                  'Setting',
                                ))
                          ],
                          currentIndex: tab.getCurrentTab,
                        ),
                      ],
                    ),
                  ),
                )));
  }
}

/*
            */
