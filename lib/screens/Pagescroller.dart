import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/models/News.dart';
import 'package:http/http.dart' as http;

class PageScroller extends StatefulWidget {
  @override
  _PageScrollerState createState() => _PageScrollerState();
}

class _PageScrollerState extends State<PageScroller> {
  late List<dynamic> fetchedNews;
  Future<void> fetchNews() async {
    String uri = "http://localhost:5000/news";
    var data = await http.get(Uri.parse(uri));
    var list = data.body as List;

    setState(() {
      fetchedNews = list.map((i) => News.fromJson(i)).toList();
      print(fetchedNews);
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
