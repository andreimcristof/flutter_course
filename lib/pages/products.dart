import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_admin.dart';
import 'package:flutter_course/product_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
            drawer: Drawer(
                child: Column(
              children: <Widget>[
                AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
                ListTile(
                  title: Text('Manage products'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ProductAdminPage()));
                  },
                )
              ],
            )),
            appBar: AppBar(title: Text('Easy List')),
            body: ProductManager());
  }
}
