// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/ListDownBuilder_new.dart';

class CatogeryViews extends StatelessWidget {
  const CatogeryViews({super.key, required this.cat_type});
  final String cat_type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Color.fromARGB(255, 210, 189, 0)),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          ListDownBuilder(
            cat_type: cat_type,
          ),
        ],
      ),
    );
  }
}
