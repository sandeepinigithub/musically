import 'package:flutter/material.dart';
import 'package:musically/ui/shared/styles.dart';

import 'SongBox.dart';

class MusicList extends StatelessWidget {
  final List<String> list;
  final String heading;
  final Size size;

  MusicList({@required this.list, @required this.heading, @required this.size});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              heading,
              style: Style.heading(size.width),
            ),
          ),
          Container(
            height: 250.0,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return MusicBox(
                    text: list[index],
                    size: size,
                  );
                }),
          ),
          SizedBox(
            height: 8.0,
          )
        ],
      ),
    );
  }
}
