import 'package:flutter/material.dart';

class NavBar {
  static getAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {},
        ),
        title: Text(
          'Tiendas',
          style: TextStyle(
              fontFamily: 'Monserrat',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: FlutterLogo(
              colors: Colors.blue,
              size: 40.0,
            ),
          )
        ],
      );
  }
}