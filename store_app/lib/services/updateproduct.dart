import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/ProductModel.dart';

class UpdateproductService {
  Future<ProductModel> updateproduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required int id,
      required String category}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );

    return ProductModel.fromJson(data);
  }
}
