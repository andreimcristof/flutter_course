import 'package:flutter/material.dart';
import 'package:flutter_course/product_control.dart';
import 'package:flutter_course/products.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _myProducts = <
      Map<String,
          String>>[]; // works w/ final because reference types can still be modified

  @override
  void initState() {
    // runs before build
    super.initState();

    if (widget.startingProduct != null) {
      _myProducts.add(widget.startingProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10.0),
            child: ProductControl(this._addProduct)),
        Expanded(
            child:
                Products(_myProducts, onRemoveProduct: this._onRemoveProduct))
      ],
    );
  }

  void _onRemoveProduct(int index) {
    setState(() {
      _myProducts.removeAt(index);
    });
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _myProducts.add(product);
    });
  }
}
