import 'package:flutter/material.dart';
import 'package:flutter_course/product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function removeProduct;

  ProductsPage(this.products, this.addProduct, this.removeProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
            ListTile(
              title: Text('Manage products'),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'admin');
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //             ProductAdminPage()));
              },
            )
          ],
        )),
        appBar: AppBar(title: Text('Easy List')),
        body: ProductManager(products, addProduct, removeProduct));
  }
}
