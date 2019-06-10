import 'package:flutter/material.dart';
import 'package:musically/ui/app.dart';
import 'package:musically/ui/views/home.dart';
import 'package:provider/provider.dart';

import 'core/TabProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => TabProvider(),
        ),
        ChangeNotifierProvider(builder: (_) => PlayProvider()),
      ],
      child: MaterialApp(
        title: 'Musically',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => App(),
          '/home': (context) => Home(),
        },
        initialRoute: '/',
      ),
    );
  }
}
