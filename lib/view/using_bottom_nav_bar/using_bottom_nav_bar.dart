import 'package:flutter/material.dart';
import 'package:flutter_examples_code/view/using_bottom_nav_bar/tabs/first.dart';
import 'package:flutter_examples_code/view/using_bottom_nav_bar/tabs/second.dart';
import 'package:flutter_examples_code/view/using_bottom_nav_bar/tabs/third.dart';


class UsingBottomNavTab extends StatefulWidget {
  @override
  _UsingBottomNavTabState createState() => _UsingBottomNavTabState();
}

class _UsingBottomNavTabState extends State<UsingBottomNavTab> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using Bottom Nav Bar"),
        backgroundColor: Colors.blue,
      ),
      body: new TabBarView(
        children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              icon: new Icon(
                Icons.favorite,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.adb
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.airport_shuttle
              ),
            )
          ],
          // 设置controller
          controller: controller,
        ),
      ),
    );
  }
}