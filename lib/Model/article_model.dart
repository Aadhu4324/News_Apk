class ArticleModel {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  ArticleModel(
      {required this.url,
      required this.title,
      required this.description,
      required this.urlToImage});
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        url: json['url'],
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage']);
  }
}
