// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/model.dart';
import 'package:news_app_ui_setup/views/catogery_views.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.model});
  final img_txt model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CatogeryViews(
                cat_type: model.type ?? 'general',
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        height: 150,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(model.img),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Center(
          child: Text(
            model.txt,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
