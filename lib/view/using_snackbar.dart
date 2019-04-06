import 'package:flutter/material.dart';

class UsingSnackBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using SnackBar"),
      ),
      body: new Center(
        child: new _Button(),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text("显示SnackBar"),
      onPressed: (){
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("随便输点什么东西"),
          duration: new Duration(seconds: 3),
          action: new SnackBarAction(
            label: "点击一下啊，来吧",
            onPressed: (){
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Hello啊，我是回复啊，你点了就有啊😯 ;)"),
              ));
            },
          ),
        ));
      },
    );
  }
}