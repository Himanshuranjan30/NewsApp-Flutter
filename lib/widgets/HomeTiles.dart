import 'package:flutter/material.dart';

class HomeTiles extends StatelessWidget {
  final String title;
  final String imageurl;
  HomeTiles(this.title, this.imageurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      child: Card(
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        borderOnForeground: true,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(
            side: new BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(4.0)),
      ),
    );
  }
}
