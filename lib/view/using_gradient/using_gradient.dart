import 'package:flutter/material.dart';
import './utils.dart' as utils;

class UsingGradient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using Gradient"),
      ),
      body: new Container(
        child: new Center(
          child: new Text(
            "写一段，看看效果怎么样",
            style: new TextStyle(color: Colors.white)
          ),
        ),
        decoration: new BoxDecoration(
          gradient: utils.getCustomGradient(),
        ),
      ),
    );
  }
}