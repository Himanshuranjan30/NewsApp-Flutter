import 'package:flutter/material.dart';
import 'package:newsapp/screens/Homepage.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(), // Provide light theme.
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
