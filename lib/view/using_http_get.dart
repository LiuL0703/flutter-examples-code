import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetHttpData extends StatefulWidget{
  @override
  GetHttpDataState createState()=> new GetHttpDataState();
}

class GetHttpDataState extends State<GetHttpData>{
  final String url = "https://swapi.co/api/people";
  List data;

  Future<String> getJSONData() async{
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json"
      }
    );
    // print(response.body);

    setState(() {
      data = json.decode(response.body)['results'];
    });
    return "Successful";
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve JSON via HTTP GET"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(
                        data[index]['name'],
                        style: new TextStyle(
                          fontSize:20.0, color: Colors.lightBlueAccent,
                        ),
                      ),
                      padding: const EdgeInsets.all(15.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void initState(){
    super.initState();
    this.getJSONData();
  }
}

