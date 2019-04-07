import 'package:flutter/material.dart';

class ImageFromNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Image from Network"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Image.network('https://raw.githubusercontent.com/LiuL0703/flutter-examples-code/master/data_repo/img/flutter_logo.png'),
            new Image.network('https://raw.githubusercontent.com/LiuL0703/flutter-examples-code/master/data_repo/img/loop_anim.gif')
          ],
        ),
      ),
    );
  }
}