import 'package:flutter/material.dart';
import 'package:musically/ui/widgets/musicList.dart';
import 'package:musically/ui/widgets/textheading.dart';

import 'SampleData.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String profileImage =
      "https://short-biography.com/wp-content/uploads/hrithik-roshan/Hrithik-Roshan.jpg";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            //Space from top for notification safe area
            height: height / 24,
          ),
          Container(
            //CustomAppBar
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Musically',
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Gothic',
                      fontSize: width / 24),
                ),
                ClipOval(
                  child: CircleAvatar(
                    child: Image.network(profileImage),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset('assets/top_banner.png',
                  fit: BoxFit.cover, width: width),
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          HeadingOne(title: 'Bollywood Romantic'),
          SizedBox(
            height: 16.0,
          ),
          Container(
            height: width / 2,
            child: MusicList(
              list: Data.bollywood,
            ),
          ),
          HeadingOne(title: 'Punjabi Pop'),
          SizedBox(
            height: 16.0,
          ),
          Container(
            height: width / 2,
            child: MusicList(
              list: Data.punjabi,
            ),
          ),
        ],
      ),
    );
  }
}
