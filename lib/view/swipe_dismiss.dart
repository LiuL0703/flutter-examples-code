import 'package:flutter/material.dart';

class SwipeToDismiss extends StatefulWidget {
  @override
  _SwipeToDismissState createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismiss> {
  final items = List<String>.generate(20, (i)=> 'Item ${i+1}');

  @override
  Widget build(BuildContext context) {
    final title = "Dismissing items";

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Dismiss Items'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          final item = items[index];

          return Dismissible(
            key: Key(item),
            onDismissed: (direction){
              setState(() {
                items.removeAt(index);
              });
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('$item dismissed'),
                )
              );
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text('title--$item'),
            ),
          );
        },
      ),
    );
  }
}