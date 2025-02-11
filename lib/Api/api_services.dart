import 'dart:convert';
import 'dart:developer';

import 'package:news_api/Api/constants.dart';
import 'package:news_api/Model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<ArticleModel?>> getTopNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonCode = jsonDecode(response.body);
      List<dynamic> articleList = jsonCode['articles'];
      List<ArticleModel?> articles = articleList.map((e) {
        if (e['urlToImage'] != null&&e['description']!=null&&e['title']!=null) {
          return ArticleModel.fromJson(e);
        }
      }).toList();

      return articles;
    }
    return [];
  }

  Future<List<ArticleModel?>> getAllNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=hot&from=2025-01-10&sortby=publishedAt&apiKey=$API_KEY";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List<dynamic> articleList = json["articles"];
      return articleList.map(
        (e) {
          if (e['urlToImage'] != null&&e['description']!=null&&e['title']!=null) {
            return ArticleModel.fromJson(e);
          }
        },
      ).toList();
    }
    return [];
  }

  Future<List<ArticleModel?>> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/everything?q=${category.toLowerCase()}&sortby=publishedAt&apiKey=$API_KEY";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List<dynamic> articleList = json['articles'];
      return articleList.map(
        (e) {
          if (e['urlToImage'] != null&&e['description']!=null&&e['title']!=null) {
            log(e.toString());
            return ArticleModel.fromJson(e);
          }
        },
      ).toList();
    }
    return [];
  }
}
