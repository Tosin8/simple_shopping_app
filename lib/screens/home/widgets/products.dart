import 'package:flutter/material.dart';
import 'package:simple_shopping_app/constants/controllers.dart';
import 'package:simple_shopping_app/models/product.dart';

import 'package:get/get.dart';

import 'single_product.dart';

class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: producsController.products.map((ProductModel product) {
          return SingleProductWidget(product: product,);
        }).toList()));
  }
}
