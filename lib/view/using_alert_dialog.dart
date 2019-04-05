import 'package:flutter/material.dart';

class UsingAlertDialog extends StatefulWidget{
  @override
  UsingAlertDialogState createState()=> new UsingAlertDialogState();
}

class UsingAlertDialogState extends State<UsingAlertDialog>{
  AlertDialog dialog = new AlertDialog(
    content: new Text(
      "一个弹框吧可能",
      style: new TextStyle(fontSize: 30.0),
    ),
  );
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Using Alert Dialog"),
      ),
      body: new Container(
        child: new Center(
          child: new RaisedButton(
            child: new Text("点击跳弹框"),
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context)=>dialog
              );
            },
          ),
        ),
      ),
    );
  }
}