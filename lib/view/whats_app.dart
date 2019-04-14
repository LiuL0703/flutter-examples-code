import 'package:flutter/material.dart';

class WhatsAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Fake Whats App"
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        padding: EdgeInsets.only(top: 6.0),
        child: new Column(
          children: <Widget>[
            new ChatItem(),
            new Divider(),
            new ChatItem(),
            new Divider(),
            new ChatItem(),
            new Divider(),
          ],
        ),
      )
    );
  }
}

class ChatItem extends StatelessWidget {

  final leftSection = new Container(
    child: new CircleAvatar(
      backgroundImage: new NetworkImage('https://raw.githubusercontent.com/LiuL0703/flutter-examples-code/master/data_repo/img/ic_launcher.png'),
      backgroundColor: Colors.white,
      radius: 24.0,
    ),
  );
  final rightSection = new Container(
    padding: EdgeInsets.only(right: 6.0),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Text(
          '18:00',
          style: new TextStyle(
            color: Colors.lightGreen,
            fontSize: 12.0,
          ),
        ),
        new CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 10.0,
          child: new Text(
            '3',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            )
          ),
        )
      ],
    ),
  );

  final middleSection = new Expanded(
    child: new Container(
      padding: new EdgeInsets.only(left: 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('UserName',
            style:new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.0
            )
          ),
          new Text('some message',
            style: new TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: new Row(
        children: <Widget>[
          leftSection,
          middleSection,
          rightSection,
        ],
      ),
    );
  }
}