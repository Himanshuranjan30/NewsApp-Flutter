import 'dart:ui';
import 'package:translator/translator.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/News.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  String title;
  String summary;
  String category;
  String photo;
  String link;

  NewsPage({
    required this.category,
    required this.link,
    required this.photo,
    required this.summary,
    required this.title,
  });

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  void launchURL(String url) async => await launch(url);
  late String title;
  late String summary;
  late String Ttitle;
  late String Tsummary;
  bool isconverted = false;
  final translator = GoogleTranslator();
  void initState() {
    title = widget.title;
    summary = widget.summary;
    if (isconverted) {
      title = Ttitle;
      summary = Tsummary;
    }
  }

  Future<void> transalate(String title, String summary) async {
    var ftitle = await translator.translate(title, to: 'pl');
    var fsummary = await translator.translate(summary, to: 'pl');
    setState(() {
      Ttitle = ftitle.toString();
      Tsummary = fsummary.toString();
      isconverted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TopImageWidget(
                    imageurl: widget.photo,
                  ),
                  TitleWidget(
                    title: widget.title,
                  ),
                  DescriptionWidget(
                    description: widget.summary,
                  ),
                  MutedTextWidget(),
                  SizedBox(height: 14),
                ],
              ),
            ),
            InkWell(
              onTap: () async =>
                  {await launch(widget.link, forceWebView: true)},
              child: BottomPart(
                title: widget.title,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  final String title;
  const BottomPart({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
          // height: 79,
          decoration: BoxDecoration(
            // color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/hat.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
            color: Colors.black,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                  alignment: Alignment.bottomLeft,
                  color: Colors.black.withOpacity(0.4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                                letterSpacing: 0.3)),
                        Text('Tap to know more here',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w300,
                              height: 1.3,
                            ))
                      ],
                    ),
                  )),
            ),
          )),
    );
  }
}

class MutedTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Text("Read More",
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12)),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  final String description;
  const DescriptionWidget({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          description,
          style: TextStyle(
              // fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              height: 1.5,
              letterSpacing: 0.8),
        ));
  }
}

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          // fontFamily: 'Montserrat',
          fontSize: 19,
        ),
      ),
    );
  }
}

class TopImageWidget extends StatelessWidget {
  final String imageurl;
  const TopImageWidget({required this.imageurl});

  @override
  Widget build(BuildContext context) {
    print(imageurl);
    return Container(
      color: Colors.black,
      // width: MediaQuery.of(context).size.width,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Image.network(
            imageurl,
          )),
    );
  }
}
