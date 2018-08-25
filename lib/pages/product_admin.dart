import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
            ListTile(
              title: Text('All products'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductsPage()));
              },
            )
          ],
        )),
        appBar: AppBar(title: Text('Product Admin')),
        body: Center(child: Text('administer products')));
  }
}
