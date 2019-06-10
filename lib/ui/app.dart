import 'package:flutter/material.dart';
import 'package:musically/core/TabProvider.dart';
import 'package:musically/ui/shared/styles.dart';
import 'package:musically/ui/views/Music.dart';
import 'package:musically/ui/views/Search.dart';
import 'package:musically/ui/views/Settings.dart';
import 'package:musically/ui/views/home.dart';
import 'package:provider/provider.dart';
import '../SampleData.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _children = [Home(), Music(), Search(), Settings()];

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<TabProvider>(context);
    final isPlaying = Provider.of<PlayProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _children[currentIndex.getCurrentTab > 1
          ? currentIndex.getCurrentTab - 1
          : currentIndex.getCurrentTab],
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Musically',
              style: Style.heading(width),
            ),
            ClipOval(
                child: CircleAvatar(
              maxRadius: width / 18,
              minRadius: width / 18,
              child: Image.network(
                Data.profileImage,
                fit: BoxFit.cover,
              ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index != 2)
            currentIndex.setCurrentTab(index);
          else if (index == 2) {
            isPlaying.play = !isPlaying.play;
          }
        },
        backgroundColor: Colors.transparent,
        selectedItemColor: Style.red,
        unselectedItemColor: Style.gray,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
                size: width / 16,
              ),
              title: Text(
                'Home',
                style: Style.smallText,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music,
                size: width / 16,
              ),
              title: Text(
                'Music',
                style: Style.smallText,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                isPlaying.play == true
                    ? Icons.play_circle_filled
                    : Icons.pause_circle_filled,
                size: width / 7,
                color: Style.red,
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
                style: Style.smallText,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: width / 16,
              ),
              title: Text(
                'Setting',
                style: Style.smallText,
              ))
        ],
        currentIndex: currentIndex.getCurrentTab,
      ),
    );
  }
}
