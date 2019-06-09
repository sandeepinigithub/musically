import 'package:flutter/material.dart';
import 'package:musically/ui/app.dart';
import 'package:musically/ui/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musically',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => App(),
        '/dashboard': (context) => Dashboard(),
      },
      initialRoute: '/',
    );
  }
}
