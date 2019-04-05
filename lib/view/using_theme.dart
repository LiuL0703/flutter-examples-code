import 'package:flutter/material.dart';

class UsingTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Theme'),
      ),
      body: new Container(
        decoration: new BoxDecoration(color: Colors.black87),
        child: new Center(
          child:new Container(
            color: Theme.of(context).accentColor,
            child: new Text('使用不同的主题',
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),

      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.red),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}
