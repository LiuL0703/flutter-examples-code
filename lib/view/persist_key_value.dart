import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Perisist extends StatefulWidget {
  @override
  _PerisistState createState() => _PerisistState();
}

class _PerisistState extends State<Perisist> {
  var nameOfApp = "Perisit Key Value";
  var counter = 0;
  var key = "counter";

  @override
  void initState() { 
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt(key) ?? 0);
    });
  }

  _onIncrementHit() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt(key) ?? 0 ) + 1;
    });

    prefs.setInt(key, counter);
  }

  _onDecrementHit() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt(key) ?? 0 ) - 1;
    });

    prefs.setInt(key, counter);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(nameOfApp),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('$counter',textScaleFactor: 10.0),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                onPressed: _onIncrementHit,
                child: new Text("Increment Counter")
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                onPressed: _onDecrementHit,
                child: new Text('Decrement Counter')
              ),
            ],
          ),
        ),
      ),
    );
  }
}