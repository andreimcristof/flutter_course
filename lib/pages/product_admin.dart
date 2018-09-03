import 'package:flutter/material.dart';
import 'package:flutter_course/pages/create_product.dart';
import 'package:flutter_course/pages/list_products.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
                child: Column(
              children: <Widget>[
                AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
                ListTile(
                  title: Text('All products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                )
              ],
            )),
            appBar: AppBar(
                title: Text('Product Admin'),
                bottom: TabBar(tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.create),
                    text: 'Create Product'
                    ),
                  Tab(
                    icon: Icon(Icons.list),
                    text: 'My Products'
                    )
                ])),
            body: TabBarView(
              children: <Widget>[
                CreateProductPage(),
                ListProductsPage()
              ],
            )));
  }
}
