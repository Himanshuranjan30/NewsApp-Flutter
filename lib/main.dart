import 'package:flutter/material.dart';
import 'package:newsapp/screens/Homepage.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/screens/Newspage.dart';
import 'package:newsapp/screens/Pagescroller.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings('logo');
    var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int? id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData.light(), // Provide light theme.
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: PageScroller("Trending"),
      routes: {},
    );
  }

  Future<dynamic> onSelectNotification(String? payload) async {
    if (payload != null) {
      var params = payload.split("_");
      print(params);
      Get.to(NewsPage(
          category: params[3],
          link: params[2],
          photo: params[4],
          summary: params[1],
          title: params[0]));
    }
  }
}
