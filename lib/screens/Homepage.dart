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
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Text("Feed"),
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
                    "assets/Trending.jpeg"),
                HomeTiles(
                    "https://cashessentials.org/?s=crypto+currency&gclid=CjwKCAjwzMeFBhBwEiwAzwS8zJlkVS4ZBlBDVw5ItP1sNhQBS-dr-JmEuFyccTxRT1LeDr4O-k0ilBoCSGsQAvD_BwE",
                    "assets/crypto.jpeg"),
                HomeTiles(
                    "https://www.thehindu.com/sci-tech/technology/weekly-bytes-instagram-insights-to-help-creators-100-million-fund-for-ai-startups-and-more/article34673492.ece",
                    "assets/insights.jpeg"),
                HomeTiles(
                    "https://www.linkedin.com/jobs/search/", "assets/Job.jpeg"),
                HomeTiles("https://tribe.kenfolios.com/", "assets/out.jpeg")
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
                                  builder: (context) => PageScroller("Travel")),
                            ),
                          },
                      child: CategoryTile("Travel", "assets/airplane.png")),
                  InkWell(
                      onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageScroller("Movies")),
                            ),
                          },
                      child: CategoryTile("Entertainment", "assets/film.png")),
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
                                  builder: (context) => PageScroller("Sports")),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      Text("View All"),
                      Icon(Icons.arrow_forward_sharp)
                    ],
                  )),
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
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              onPressed: () {},
            ),
          ],
        ),
      )),
    );
  }
}
