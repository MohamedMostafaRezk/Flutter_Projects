import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/ProductModel.dart';

class CategriosService {
  Future<List<ProductModel>> getCategrios(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }

    return productList;
  }
}
