import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsapp/models/Insight.dart';
import 'package:newsapp/models/News.dart';
import 'package:newsapp/screens/Newspage.dart';
import 'package:newsapp/screens/Pagescroller.dart';
import 'package:newsapp/screens/aboutme.dart';
import 'package:newsapp/widgets/HomeTiles.dart';
import 'package:newsapp/widgets/InsightTile.dart';
import 'package:newsapp/widgets/categorytile.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<News> fetchedNews = [];
  late List<Insight> fetchedInsights = [];
  Future<void> fetchInsights() async {
    String uri = "https://salty-shelf-10140.herokuapp.com/insight";
    var data = await http.get(Uri.parse(uri));
    print(data.body);
    var list = json.decode(data.body) as List;
    setState(() {
      fetchedInsights = list.map((i) => Insight.fromJson(i)).toList();
    });
  }

  Future<void> fetchNews() async {
    String uri =
        "https://salty-shelf-10140.herokuapp.com/newsbycategory/Finance";
    var data = await http.get(Uri.parse(uri));
    print(data.body);
    var list = json.decode(data.body) as List;

    setState(() {
      fetchedNews = list.map((i) => News.fromJson(i)).toList();
    });
    // scheduleAlarm(DateTime.now(), "Notification");
    await fetchInsights();
    scheduledNotification();
  }

  // void scheduleAlarm(
  //     DateTime scheduledNotificationDateTime, String test) async {
  //   var rng = new Random();
  //   int randomNumber = rng.nextInt(1);
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //     'alarm_notif',
  //     'alarm_notif',
  //     'Channel for Alarm notification',
  //     icon: 'logo',
  //     largeIcon: DrawableResourceAndroidBitmap('logo'),
  //   );

  //   var iOSPlatformChannelSpecifics = IOSNotificationDetails(
  //       sound: 'a_long_cold_sting.wav',
  //       presentAlert: true,
  //       presentBadge: true,
  //       presentSound: true);
  //   var platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: iOSPlatformChannelSpecifics);

  //   await flutterLocalNotificationsPlugin.schedule(
  //       0,
  //       fetchedNews[0].title,
  //       fetchedNews[0].summary,
  //       scheduledNotificationDateTime,
  //       platformChannelSpecifics,
  //       payload: fetchedNews[0].title +
  //           "_" +
  //           fetchedNews[0].summary +
  //           "_" +
  //           fetchedNews[0].article +
  //           "_" +
  //           fetchedNews[0].category +
  //           "_" +
  //           fetchedNews[0].photo);
  // }

  Future scheduledNotification() async {
    var interval = RepeatInterval.everyMinute;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'logo',
      largeIcon: DrawableResourceAndroidBitmap('logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platform =
        new NotificationDetails(android: androidPlatformChannelSpecifics);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        fetchedNews[0].title,
        fetchedNews[0].summary,
        interval,
        platformChannelSpecifics,
        payload: fetchedNews[0].title +
            "_" +
            fetchedNews[0].summary +
            "_" +
            fetchedNews[0].article +
            "_" +
            fetchedNews[0].category +
            "_" +
            fetchedNews[0].photo);
  }

  //Cancel notification

  Future cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  void initState() {
    fetchNews();
    fetchInsights();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 40,
        title: Text(
          "Addition Code",
          style: GoogleFonts.lato(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(Icons.settings),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    "Discover",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageScroller("Trending")),
                        ),
                      },
                      child: Text(
                        "Feed",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_sharp),
                  ],
                )
              ]),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  HomeTiles(
                      "https://indianexpress.com/section/trending/trending-globally/",
                      "assets/trending.png",
                      "Trending"),
                  HomeTiles(
                      "https://cashessentials.org/?s=crypto+currency&gclid=CjwKCAjwzMeFBhBwEiwAzwS8zJlkVS4ZBlBDVw5ItP1sNhQBS-dr-JmEuFyccTxRT1LeDr4O-k0ilBoCSGsQAvD_BwE",
                      "assets/crypto.png",
                      "Crypto"),
                  HomeTiles("https://www.linkedin.com/jobs/search/",
                      "assets/job.png", "Jobs"),
                  HomeTiles("https://tribe.kenfolios.com/", "assets/out.png",
                      "Unorthodox")
                ]),
              ),
              SizedBox(height: 50),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      child: CategoryTile("Covid", "assets/virus.png"),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageScroller("Covid")),
                        ),
                      },
                    ),
                    InkWell(
                      child: CategoryTile("Finance", "assets/revenue.png"),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageScroller("Finance")),
                        ),
                      },
                    ),
                    InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PageScroller("Technology")),
                              ),
                            },
                        child:
                            CategoryTile("Technology", "assets/processor.png")),
                    InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PageScroller("Education")),
                              ),
                            },
                        child:
                            CategoryTile("Education", "assets/graduation.png")),
                    InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PageScroller("Science")),
                              ),
                            },
                        child: CategoryTile("Science", "assets/chemistry.png")),
                    InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PageScroller("Bussiness")),
                              ),
                            },
                        child:
                            CategoryTile("Bussiness", "assets/conference.png")),
                    InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PageScroller("Travel")),
                              ),
                            },
                        child: CategoryTile("Travel", "assets/airplane.png")),
                    InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PageScroller("Movies")),
                              ),
                            },
                        child:
                            CategoryTile("Entertainment", "assets/film.png")),
                    InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PageScroller("Startups")),
                              ),
                            },
                        child: CategoryTile("Startups", "assets/rocket.png")),
                    InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PageScroller("Sports")),
                              ),
                            },
                        child: CategoryTile("Sports", "assets/medal.png")),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Insights",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
              Divider(
                color: Colors.black,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  InsightTile(
                      fetchedInsights[0].article, fetchedInsights[0].photo),
                  InsightTile(
                      fetchedInsights[1].article, fetchedInsights[1].photo),
                  InsightTile(
                      fetchedInsights[2].article, fetchedInsights[2].photo),
                  InsightTile(
                      fetchedInsights[3].article, fetchedInsights[3].photo),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                elevation: 5.0,
                minWidth: 200.0,
                height: 35,
                color: Colors.blue,
                child: new Text(
                  'Contact Us',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutMe()),
                  ),
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
