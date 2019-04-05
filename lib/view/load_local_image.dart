import 'package:flutter/material.dart';

class LoadLocalImage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Load Local Image'),
      ),
      body: new Container(
        child: new Center(
          child: new Text(
            "随便什么",
            style: new TextStyle(color: Colors.white,fontSize: 20.0),
          ),
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('data_repo/img/bg1.jpg'),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}