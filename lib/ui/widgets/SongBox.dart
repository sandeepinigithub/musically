import 'package:flutter/material.dart';
import 'package:musically/ui/shared/styles.dart';

import '../../SampleData.dart';

class MusicBox extends StatelessWidget {
  final Size size;
  final String text;

  MusicBox({@required this.size, @required this.text});

  String profileImage =
      "https://short-biography.com/wp-content/uploads/hrithik-roshan/Hrithik-Roshan.jpg";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: size.width / 2.8,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: size.width / 2.8,
              height: size.width / 2.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(Data.profileImage),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Style.headingSmall(size.width / 4),
            ),
          ],
        ),
      ),
      elevation: 0.0,
    );
  }
}
