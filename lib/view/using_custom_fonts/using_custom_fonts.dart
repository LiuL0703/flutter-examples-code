import 'package:flutter/material.dart';
import './utils.dart' as utils;

class UsingCustomFonts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using Cutom Fonts"),
      ),
      body: new Container(
        child: new Center(
          child: new Text(
            "新字体，试试ENGLISH,the quick brown for jupms over thw lazy dog",
            textAlign: TextAlign.center,
            style: utils.getCustomFontTextStyle(),
          ),
        ),
      ),
    );
  }
}