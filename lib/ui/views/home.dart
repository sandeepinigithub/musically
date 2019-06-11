import 'package:flutter/material.dart';
import 'package:musically/ui/widgets/SongBox.dart';
import 'package:musically/ui/widgets/music_list.dart';

import '../../SampleData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: Data.heading_music.length,
        itemBuilder: (context, index) {
          return MusicList(
            heading: Data.heading_music[index],
            size: size,
            list: Data.bollywood,
          );
        });
  }
}
