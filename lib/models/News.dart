class News {
  late String title;
  late String summary;
  late String article;
  late String category;
  late String photo;

  News(
      {required this.title,
      required this.summary,
      required this.article,
      required this.category,
      required this.photo});

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    summary = json['summary'];
    article = json['article'];
    category = json['category'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['article'] = this.article;
    data['category'] = this.category;
    data['photo'] = this.photo;
    return data;
  }
}
