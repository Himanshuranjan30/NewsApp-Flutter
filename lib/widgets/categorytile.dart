import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final String imageurl;
  CategoryTile(this.title, this.imageurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageurl,
                width: 50,
                height: 50,
              ),
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // borderOnForeground: true,
        // shadowColor: Colors.blue,
        // shape: RoundedRectangleBorder(
        //     side: new BorderSide(color: Colors.white, width: 2.0),
        //     borderRadius: BorderRadius.circular(4.0)),
      ),
    );
  }
}
