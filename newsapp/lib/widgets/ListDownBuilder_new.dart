// ignore_for_file: non_constant_identifier_names, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/services/app_service.dart';
import 'package:news_app_ui_setup/widgets/list_down_model.dart';

// class ListDownBuilder extends StatefulWidget {
//   const ListDownBuilder({
//     super.key,
//   });

//   @override
//   State<ListDownBuilder> createState() => _ListDownBuilderState();
// }

// kol comments dh 34an a4t8lna mn 5er futureBuilder that used with APi mn 5erha will use statefulwidget

class ListDownBuilder extends StatefulWidget {
  const ListDownBuilder({super.key, required this.cat_type});
  final String cat_type;
  @override
  State<ListDownBuilder> createState() => _ListDownBuilderState();
}

class _ListDownBuilderState extends State<ListDownBuilder> {
  //bool isloading = true;
  var future;

  @override
  void initState() {
    // use it 34an m4 kol ma a3ml rebuild aroh call api mn tany duto momken ykoon b money
    super.initState();
    future = NewsService(Dio()).getNews(cat: widget.cat_type);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListDownModel(
            //articles: articles,
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              heightFactor: 12,
              child: Text('oops there was an error'),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              heightFactor: 12,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );

    // return isloading
    //     ? const SliverToBoxAdapter(
    //         child: Center(heightFactor: 12, child: CircularProgressIndicator()))
    //     : articles.isNotEmpty
    //         ? ListDownModel(
    //             articles: articles,
    //           )
    //         : const SliverToBoxAdapter(
    //             child: Center(
    //               heightFactor: 12,
    //               child: Text('oops there was an error'),
    //             ),
    //           );
  }
}
