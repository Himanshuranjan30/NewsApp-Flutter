import 'package:flutter/material.dart';

class InsightTile extends StatelessWidget {
  final String imageurl;
  InsightTile(this.imageurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          imageurl,
          fit: BoxFit.fill,
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
