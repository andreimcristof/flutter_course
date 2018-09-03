import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product.dart';
import 'package:flutter_course/pages/product_admin.dart';
import 'package:flutter_course/pages/products.dart';

main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = <Map<String, String>>[];

  void _removeProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowMaterialGrid: true,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepPurple),
        // home: AuthPage(),
        routes: {
          '/': (BuildContext context) =>
              ProductsPage(_products, _addProduct, _removeProduct),
          'admin': (BuildContext context) => ProductAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                builder: (context) => ProductPage(
                    _products[index]['title'], _products[index]['image']));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          //go home
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  ProductsPage(_products, _addProduct, _removeProduct));
        });
  }
}
