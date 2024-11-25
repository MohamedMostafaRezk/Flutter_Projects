// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/ProductModel.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProdcuts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }

    return productList;
  }
}
