import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  CustomForm({Key key}) : super(key: key);

  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.addListener(_printLatesValue);
  }

  void _printLatesValue(){
    print('Text Field Value:${controller.text}');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Custom Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text){
                print('First Field: $text');
              },
            ),
            TextField(
              controller: controller,
            )
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(controller.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}