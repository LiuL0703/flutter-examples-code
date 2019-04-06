import 'package:flutter/material.dart';
import 'package:flutter_examples_code/view/using_tab/tabs/first.dart';
import 'package:flutter_examples_code/view/using_tab/tabs/second.dart';
import 'package:flutter_examples_code/view/using_tab/tabs/third.dart';

class UsingTab extends StatefulWidget{
  @override
  UsingTabState createState()=> new UsingTabState();
}

class UsingTabState extends State<UsingTab> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar(){
    return new TabBar(
      tabs: <Tab>[
        new Tab(
          icon: new Icon(Icons.favorite),
        ),
        new Tab(
          icon: new Icon(Icons.adb),
        ),
        new Tab(
          icon: new Icon(Icons.airport_shuttle),
        )
      ],
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs){
    return new TabBarView(
      children: tabs,
      controller: controller,
    );
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using Tab"),
        backgroundColor: Colors.lightBlueAccent,
        bottom: getTabBar(),
      ),
      body: getTabBarView(<Widget>[new First(), new Second(),new Third()]),
    );
  }
}
