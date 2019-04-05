import 'package:flutter/material.dart';

class EditText extends StatefulWidget{
  @override
  EditTextState createState() => new EditTextState();
}

class EditTextState extends State<EditText>{
  String results = "";
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text("使用EditText"),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "这是输入提示"),
                onSubmitted: (String str){
                  setState(() {
                    results = results + "\n" + str;
                    controller.text = "";
                  });
                },
                controller: controller,
              ),
              new Text(results,style: TextStyle(fontSize: 20.0,color: Colors.redAccent))
            ],
          ),
        ),
      ),
    );
  }
}