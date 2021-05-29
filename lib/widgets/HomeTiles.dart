import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTiles extends StatelessWidget {
  final String imageurl;
  final String articleurl;
  HomeTiles(this.articleurl, this.imageurl);
  void launchURL(String url) async => await launch(url);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      child: Card(
        child: InkWell(
          child: Image.asset(
            imageurl,
            fit: BoxFit.fill,
          ),
          onTap: () async => {await launch(articleurl, forceWebView: true)},
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
