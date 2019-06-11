import 'package:flutter/material.dart';
import 'package:musically/routers.dart';
import 'package:musically/ui/app.dart';
import 'package:musically/ui/views/Music.dart';
import 'package:musically/ui/views/Search.dart';
import 'package:musically/ui/views/Settings.dart';
import 'package:musically/ui/views/Home.dart';
import 'package:provider/provider.dart';

import 'core/TabProvider.dart';
import 'core/viewmodel/homeviewmodel.dart';

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
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
