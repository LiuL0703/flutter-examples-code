import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  List _fruits = ["Apple🍎","Banana🍌","Mango🍊","PineApple🍍","Grapes🍇"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;
  
  @override
  void initState(){
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits){
    List<DropdownMenuItem<String>> items = new List();
    for(String fruit in fruits){
      items.add(new DropdownMenuItem(value: fruit,child: new Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectFruit){
    setState(() {
      _selectedFruit = selectFruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DropDown Button Demo"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("选择一种水果😬😬: "),
              new DropdownButton(
                value: _selectedFruit,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ],
          ),
        ),
      ),
    );
  }
}