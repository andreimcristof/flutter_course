import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  // stateless because the actual data/state changes somewhere else
  final List<Map<String, String>>
      _myProducts; // final: value of products will never change. It is initialized once with ctor and never changes
  final Function removeProduct;

  Products(this._myProducts,
      {this.removeProduct}); //ctor: shortcut of init with aprameter passed into local field

  Widget _productItem(BuildContext context, int index) {
    final thisProduct = this._myProducts[index];

    return Card(
        // each product maps into a Card widget
        child: Column(children: <Widget>[
      Image.asset(thisProduct['image']),
      Text(thisProduct['title']),
      ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
        FlatButton(
            child: Text('Details'),
            onPressed: () => Navigator.pushNamed<bool>(
                        context, '/product/' + index.toString())
                    .then((bool value) {
                  if (value) {
                    removeProduct(index);
                  }
                }))
      ])
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return _myProducts.length > 0
        ? _buildProductList()
        : noProductsFoundWidget();
  }

  Widget noProductsFoundWidget() =>
      Center(child: Text('no products found, add some'));

  Widget _buildProductList() {
    return ListView.builder(
      itemBuilder: _productItem,
      itemCount: _myProducts.length,
    );
  }
}
