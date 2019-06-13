import 'package:flutter/material.dart';

class FontStyle {
  //define font style here
  static medium_bold_gothic(var size) => TextStyle(
      fontSize: size / 24.0, fontFamily: 'Gothic', color: Colors.black);

  static small_bold_gothic(var size) =>
      TextStyle(fontSize: size / 44, fontFamily: 'Gothic', color: Colors.black);

  static very_small_bold_gothic(var size) =>
      TextStyle(fontSize: size / 48, fontFamily: 'Gothic', color: Colors.black);

  static medium_open_sans(var size) =>
      TextStyle(fontSize: size, fontFamily: 'Gothic', color: Colors.black);

  static small_open_sans(var size) => TextStyle(
      fontSize: size / 36, fontFamily: 'Gothic', color: Colors.black54);
}
