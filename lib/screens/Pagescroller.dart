import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/models/News.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/screens/Newspage.dart';

class PageScroller extends StatefulWidget {
  String category;
  PageScroller(this.category);
  @override
  _PageScrollerState createState() => _PageScrollerState();
}

class _PageScrollerState extends State<PageScroller> {
  late List<News> fetchedNews = [];
  Future<void> fetchNews() async {
    String uri = "https://salty-shelf-10140.herokuapp.com/newsbycategory/${widget.category}";
    var data = await http.get(Uri.parse(uri));
    print(data.body);
    var list = json.decode(data.body) as List;

    setState(() {
      fetchedNews = list.map((i) => News.fromJson(i)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    fetchNews();
  }

  PageController controller = PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: fetchedNews.length,
        controller: controller,
        itemBuilder: (BuildContext context, int itemIndex) {
          return NewsPage(
              category: fetchedNews[itemIndex].category,
              link: fetchedNews[itemIndex].article,
              photo: fetchedNews[itemIndex].photo,
              summary: fetchedNews[itemIndex].summary,
              title: fetchedNews[itemIndex].title);
        });
  }
}
