import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InsightTile extends StatelessWidget {
  final String articleurl;
  final String imageurl;
  InsightTile(this.articleurl, this.imageurl);

  void launchURL(String url) async => await launch(url);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      child: InkWell(
        onTap: () async => {await launch(articleurl, forceWebView: true)},
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            imageurl,
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
