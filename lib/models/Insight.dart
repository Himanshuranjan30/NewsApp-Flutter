class Insight {
  late String article;
  late String photo;

  Insight({required this.article, required this.photo});

  Insight.fromJson(Map<String, dynamic> json) {
    article = json['article'];

    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['article'] = this.article;

    data['photo'] = this.photo;
    return data;
  }
}
