import 'package:flutter/material.dart';
import 'package:newsapp/screens/Newspage.dart';
import 'package:newsapp/screens/Pagescroller.dart';
import 'package:newsapp/widgets/HomeTiles.dart';
import 'package:newsapp/widgets/InsightTile.dart';
import 'package:newsapp/widgets/categorytile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.settings),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          "Discover",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      TextButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Feed",
                            style: TextStyle(color: Colors.black),
                          ))
                    ]),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    HomeTiles("Insights", ""),
                    HomeTiles("Ctypto", ""),
                    HomeTiles("Giri", ""),
                    HomeTiles("Himanshu", " "),
                    HomeTiles("Prisat", " ")
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
                                builder: (context) => NewsPage(
                                      category: "Covid",
                                      link: "just a link",
                                      photo: "assets/hat.png",
                                      summary: "Just a summary",
                                      title: "Title",
                                    )),
                          ),
                        },
                      ),
                      InkWell(
                        child: CategoryTile("Finance", "assets/revenue.png"),
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageScroller()),
                          ),
                        },
                      ),
                      CategoryTile("Technology", "assets/processor.png"),
                      CategoryTile("Education", "assets/graduation.png"),
                      CategoryTile("Science", "assets/chemistry.png"),
                      CategoryTile("Bussiness", "assets/conference.png"),
                      CategoryTile("Travel", "assets/airplane.png"),
                      CategoryTile("Entertainment", "assets/film.png"),
                      CategoryTile("Achievements", "assets/medal.png"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Insights",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextButton.icon(
                              onPressed: null,
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                              label: Text(
                                "View All",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ))),
                    ]),
                Divider(
                  color: Colors.black,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    InsightTile("assets/airplane.png"),
                    InsightTile("assets/film.png"),
                    InsightTile("assets/hat.png"),
                    InsightTile("assets/medal.png"),
                    InsightTile("assets/virus.png")
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
                  child: new Text('Contact Us',
                      style:
                          new TextStyle(fontSize: 16.0, color: Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
