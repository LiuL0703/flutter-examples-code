import 'package:flutter/material.dart';

class StatefulDemo extends StatefulWidget{
  @override
  StatefulDemoState createState(){
    return new StatefulDemoState();
  }
}

class StatefulDemoState extends State<StatefulDemo>{
  var counter = 0;
  List<String> strings = ['Flutter', 'React', 'React-Native', 'Weex', 'Native','你猜'];
  String displayString = "随便写点什么";

  void onPressButton(){
    setState(() {
      displayString = strings[counter];
      counter = counter < strings.length - 1 ? counter + 1 : 0;
      // print('counter:$counter');
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stateful Widget"),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(displayString, style: new TextStyle(fontSize: 40.0)),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                child: new Text(
                  "动我一下试试",
                  style: new TextStyle(color: Colors.white),
                ),
                color: Colors.redAccent,
                onPressed: onPressButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}