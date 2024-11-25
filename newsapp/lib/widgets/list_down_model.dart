// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/widgets/list_view_down.dart';

class ListDownModel extends StatelessWidget {
  ListDownModel({super.key, required this.articles});
  // final List<img_txt> categories_down = const [
  //   img_txt(
  //     img:
  //         'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhciqsYOBO5fckMF7cbobasnk4nVyIHQuiO3OoheKEz3NXtng7LX8VEiNG9ZppghYcSXT4zr8YXZIwUSGrbml9vRyXkSEeNbUvTrNY2MQryR12tYtbOHuH8US1tsYevY4KufdTpEajYlqyV7pyVhtIMPZmTnoEtIxYswG_6S37-c8C5WAjZYJo7UglumIl4/w1200-h630-p-k-no-nu/%D9%85%D9%88%D8%B9%D8%AF-%D9%86%D8%AA%D8%A7%D8%A6%D8%AC-%D8%A7%D9%84%D8%AB%D8%A7%D9%86%D9%88%D9%8A%D8%A9-%D8%A7%D9%84%D8%B9%D8%A7%D9%85%D8%A9-%D9%81%D9%8A-%D9%81%D9%84%D8%B3%D8%B7%D9%8A%D9%86-20236-1.jpg',
  //     txt:
  //         'التعليم: ترقبوا موعد إعلان نتيجة الثانوية العامة 2024 "الرسمي" واحذروا الشائعات',
  //     txt2:
  //         'أنباء تزعم أنه قد تقرر نهائي ورسمي أن يكون موعد نتيجة الثانوية العامة 2024 يوم الخميس القادم ، على أن يتم إعلان أوائل الثانوية العامة 2024 قبلها بيوم أي يوم الأربعاء القادم.',
  //   ),
  //   img_txt(
  //     img:
  //         'https://pbs.twimg.com/media/F99SOOiXgAEQ-zq?format=jpg&name=4096x4096',
  //     txt:
  //         'يستعد نادي الزمالك لمواجهة نادي زد في مباراة مهمة ضمن مباريات الدوري المصري الممتاز. تعد هذه المباراة تحديًا كبيرًا لكلا الفريقين، حيث يسعى الزمالك لتعزيز مكانته في البطولة وتحقيق الفوز للاقتراب من صدارة الترتيب. بالمقابل، يتطلع فريق زد لتحقيق نتيجة إيجابية ومفاجأة الزمالك في هذه المواجهة.',
  //     txt2:
  //         'ستكون المباراة بالتأكيد مليئة بالإثارة والتشويق، ومن المتوقع أن تكون هناك منافسة قوية بين الفريقين على أرض الملعب.',
  //   ),
  //   img_txt(
  //     img:
  //         'https://el-ahly.com/images/news/191171-%D8%A7%D9%84%D8%AA%D8%A7%D9%84%D8%AA-%D9%88%D8%A7%D9%84%D8%B1%D8%A7%D8%A8%D8%B9.jpg',
  //     txt:
  //         'يستعد النادي الأهلي لخوض مواجهة مهمة في الدوري المصري الممتاز أمام فريق قوي ومنافس. تأتي هذه المباراة في وقت حاسم حيث يسعى الأهلي للحفاظ على مكانته في قمة جدول الترتيب والمضي قدمًا نحو تحقيق لقب الدوري.',
  //     txt2:
  //         'ستكون المباراة بالتأكيد مليئة بالإثارة والتشويق، حيث يسعى كل فريق لتحقيق أهدافه في هذه المرحلة الحاسمة من الدوري. يعتبر هذا اللقاء فرصة كبيرة للأهلي لتعزيز مكانته في الصدارة وللمنافس لتحقيق مفاجأة وإثبات قوته أمام بطل الدوري.',
  //   ),
  //   img_txt(
  //     img: 'https://www.banker.news/UploadCache/libfiles/3/8/600x338o/85.jpg',
  //     txt: 'اليوم، 25 يوليو 2024، شهدت أسعار الذهب في مصر تبايناً طفيفاً.',
  //     txt2:
  //         'تتأثر أسعار الذهب المحلية بحركة أسعار الأوقية العالمية التي سجلت نحو 2417 دولارًا للأوقية في آخر تحديثات السوق',
  //   ),
  // ];

  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    //NewsService(Dio()).getNews(); // do not put api class here duto you will call it more than time and it is not a solution

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        //childCount: categories_down.length,
        childCount: articles.length,
        (context, index) {
          return ListViewDown(
            articleModel: articles[index],
            // model: categories_down[index],
          );
        },
      ),
    );
  }
}
