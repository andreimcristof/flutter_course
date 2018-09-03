import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('are you sure?'),
            content: Text('this action cannot be undone'),
            actions: <Widget>[
              FlatButton(
                child: Text('Confirm'),
                onPressed: () {
                  Navigator.pop(context); //this closes dialog
                  Navigator.pop(context, true); // this navigates away
                },
              ),
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(title: Text(this.title)),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(this.imageUrl),
                Container(
                    padding: EdgeInsets.all(10.0), child: Text(this.title)),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text('DELETE'),
                        onPressed: () => _showWarningDialog(context)))
              ],
            )),
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        });
  }
}
