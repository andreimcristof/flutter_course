import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products.dart';

class AuthPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
          color: Theme.of(context).accentColor,
          child: Text('Login'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        )),
        appBar: AppBar(title: Text('Please authenticate')));
  }
}
