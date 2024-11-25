// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/ListDownBuilder_new.dart';
import 'package:news_app_ui_setup/widgets/category_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Category_Listview(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            ListDownBuilder(
              cat_type: 'general',
            ),
          ],
        ),
      ),
    );
  }
}
