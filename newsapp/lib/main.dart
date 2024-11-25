// ignore_for_file: avoid_print, unused_local_variable, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/Home_page.dart';
import 'package:news_app_ui_setup/services/app_service.dart';

void main() {
  NewsService(Dio()).getNews(cat: 'general');
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
