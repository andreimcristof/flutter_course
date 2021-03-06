import 'package:flutter/material.dart';
import 'package:flutter_course/product_control.dart';
import 'package:flutter_course/products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function removeProduct;

  ProductManager(this.products, this.addProduct, this.removeProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10.0),
            child: ProductControl(this.addProduct)),
        Expanded(child: Products(products, removeProduct: this.removeProduct))
      ],
    );
  }
}
