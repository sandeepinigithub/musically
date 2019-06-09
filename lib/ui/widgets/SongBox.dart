import 'package:flutter/material.dart';
import 'package:musically/ui/shared/styles.dart';

class MusicBox extends StatelessWidget {
  final Size size;
  final String text;

  MusicBox({@required this.size, @required this.text});

  String profileImage =
      "https://short-biography.com/wp-content/uploads/hrithik-roshan/Hrithik-Roshan.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                width: size.width / 2.5,
                height: size.width / 2.5,
                color: Colors.black26,
                child: Image.network(profileImage),
              ),
            ),
            Text(
              text,
              style: Style.headingsmall,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
