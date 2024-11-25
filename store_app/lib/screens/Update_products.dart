// ignore_for_file: non_constant_identifier_names, must_be_immutable, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/ProductModel.dart';
import 'package:store_app/services/updateproduct.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/Customtextfield.dart';

class UpdateProducts extends StatefulWidget {
  UpdateProducts({super.key});
  static String id = 'updatepage';

  @override
  State<UpdateProducts> createState() => _UpdateProductsState();
}

class _UpdateProductsState extends State<UpdateProducts> {
  String? ProductName, discription, image;

  String? price;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'UpdateProduct',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                onChanged: (data) {
                  ProductName = data;
                },
                hintText: 'Product name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChanged: (data) {
                  discription = data;
                },
                hintText: 'discription',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                inputType: TextInputType.number,
                onChanged: (data) {
                  if (data.isEmpty) {
                    price = null; // Set price to null if the input is empty
                  } else {
                    try {
                      price = data; // Try parsing the input
                    } catch (e) {
                      // Handle invalid input (e.g., not a valid number)
                      price = null;
                    }
                  }
                },
                hintText: 'Price',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hintText: 'Image',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButon(
                text: 'Update',
                onTap: () async {
                  isloading = true;
                  setState(() {});
                  try {
                    await updatedproduct(product);
                  } on Exception catch (e) {
                    print(e.toString());
                  }
                  isloading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updatedproduct(ProductModel product) async {
    await UpdateproductService().updateproduct(
      id: product.id,
      title: ProductName == null ? product.title : ProductName!,
      price: price == null ? product.price.toString() : price!,
      description: discription == null ? product.description : discription!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
