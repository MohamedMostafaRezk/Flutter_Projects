// ignore_for_file: camel_case_types, unused_import, avoid_print, non_constant_identifier_names, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/models/model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  // void getNews() async {
  //   final response = await dio.get('https://dart.dev');
  //   print(response);
  // }
// Lazem Response
// Future come with async
  Future<List<ArticleModel>> getNews({required String cat}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737&category=$cat');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
          url: article['url'],
        );
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      print('error ya dev.');
      return [];
    }
  }

  // Response response = await dio.get(
  //     'https://api.worldnewsapi.com/top-news?api-key=ab325c3382d8494796bac15d888f3461&source-country=us&language=en');

  // Map<String, dynamic> jsonData = response.data;

  // List<dynamic> Articles = jsonData['top_news'];

  // List<ArticleModel> articleList = [];

  // for (var article in Articles) {
  //   ArticleModel obj = ArticleModel(
  //     image: article['image'],
  //     title: article['title'],
  //     subTitle: article['summary'],
  //   );
  //   articleList.add(obj);
  //   print(articleList[0].image);
  // }

  // return articleList;
}
