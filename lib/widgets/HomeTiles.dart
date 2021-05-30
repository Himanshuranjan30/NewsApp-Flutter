import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTiles extends StatelessWidget {
  final String imageurl;
  final String articleurl;
  final String title;
  HomeTiles(this.articleurl, this.imageurl, this.title);
  void launchURL(String url) async => await launch(url);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 130,
      child: Card(
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imageurl,
                height: 50,
                width: 50,
              ),
              Text(title,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          onTap: () async => {await launch(articleurl, forceWebView: true)},
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: Color.fromARGB(255, 0, 0, 139),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
