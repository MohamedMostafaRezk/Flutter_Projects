// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/model.dart';
import 'package:news_app_ui_setup/widgets/category.dart';

class Category_Listview extends StatelessWidget {
  const Category_Listview({super.key});
  final List<img_txt> categories = const [
    img_txt(
      img: 'assets/business.avif',
      txt: 'Bussines',
      type: 'business',
    ),
    img_txt(
      img: 'assets/entertaiment.avif',
      txt: 'Entertainment',
      type: 'entertainment',
    ),
    img_txt(
      img: 'assets/sports.avif',
      txt: 'Sports',
      type: 'sports',
    ),
    img_txt(
      img: 'assets/health.avif',
      txt: 'Health',
      type: 'health',
    ),
    img_txt(
      img: 'assets/science.avif',
      txt: 'Science',
      type: 'science',
    ),
    img_txt(
      img: 'assets/technology.jpeg',
      txt: 'Technology',
      type: 'technology',
    ),
    img_txt(
      img: 'assets/general.avif',
      txt: 'General news',
      type: 'general',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Category(
            model: categories[index],
          );
        },
      ),
    );
  }
}
