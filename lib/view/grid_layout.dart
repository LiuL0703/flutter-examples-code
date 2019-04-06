import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  final UsingGridView usingGridView = new UsingGridView();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Grid Layout'),
      ),
      body: usingGridView.build(),
    );
  }
}

class UsingGridView {
  Card getStructuredGridCell(name, image){
    return new Card(
      elevation: 1.5,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Image(image: new AssetImage('data_repo/img/'+image)),
          new Center(
            child: new Text(name),
          ),
        ],
      ),
    );
  }

  GridView build(){
    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell("FaceBook", "social/facebook.png"),
        getStructuredGridCell("Twitter", "social/twitter.png"),
        getStructuredGridCell("Instagram", "social/instagram.png"),
        getStructuredGridCell("Linkedin", "social/linkedin.png"),
        getStructuredGridCell("Google+", "social/google_plus.png"),
        getStructuredGridCell("Launcher Icon", "ic_launcher.png")
      ],
    );
  }
}