// ignore_for_file: prefer_const_constructors_in_immutables, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewDown extends StatelessWidget {
  ListViewDown({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            launch(articleModel.url ?? 'www.google.com');
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Align(
                alignment: Alignment.topCenter,
                child: articleModel.image != null
                    ? Image.network(
                        articleModel.image!,
                      )
                    : Image.asset('assets/black.jpg'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            articleModel.title ?? ' ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            articleModel.subTitle ?? ' ',
            maxLines: 2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
