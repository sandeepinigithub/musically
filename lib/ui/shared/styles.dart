import 'package:flutter/material.dart';

class Style {
  static heading(var size) =>
      TextStyle(fontSize: size/24.0, fontFamily: 'Gothic', color: Colors.black);

  static headingsmall(var size) =>
      TextStyle(fontSize: size/10.0, fontFamily: 'Gothic', color: Colors.black);
  static final red = Color(0xfffc0506);
  static final dark = Color(0xff2a2a2a);
  static final gray = Color(0xff969696);
  static final yellow = Color(0xfff49818);
  static final smallText =
      TextStyle(fontFamily: 'OpenSans', fontSize: 8.0, color: dark);
}
