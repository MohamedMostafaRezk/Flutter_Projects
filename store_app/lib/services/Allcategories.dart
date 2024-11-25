// ignore_for_file: file_names

import 'package:store_app/helper/Api.dart';

class Allcategories {
  Future<List<dynamic>> getAllcategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
