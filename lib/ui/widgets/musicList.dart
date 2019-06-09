import 'package:flutter/material.dart';

import 'SongBox.dart';

class MusicList extends StatelessWidget {
  final List<String> list;

  MusicList({@required this.list});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return MusicBox(
            text: list[index],
            size: size,
          );
        });
  }
}
