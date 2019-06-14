import 'package:flutter/material.dart';
import 'package:musically/routers.dart';
import 'package:musically/ui/app.dart';
import 'package:musically/ui/locator.dart';
import 'package:musically/ui/views/Music.dart';
import 'package:musically/ui/views/Search.dart';
import 'package:musically/ui/views/Settings.dart';
import 'package:musically/ui/views/Home.dart';
import 'package:provider/provider.dart';

import 'package:musically/core/viewmodel/TabProvider.dart';
import 'core/viewmodel/homeviewmodel.dart';
import 'core/viewmodel/music_model.dart';

void main() {
  setLocator();
  runApp(MyApp());
}

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
        ChangeNotifierProvider(builder: (_) => PlayerProvider()),
      ],
      child: MaterialApp(
        title: 'Musically',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
