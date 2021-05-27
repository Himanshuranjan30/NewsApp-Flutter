import 'package:flutter/material.dart';
import 'package:newsapp/widgets/HomeTiles.dart';

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
                )
              ],
            ),
          )),
    );
  }
}
