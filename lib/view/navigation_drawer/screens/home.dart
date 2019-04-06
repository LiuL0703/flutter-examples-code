import 'package:flutter/material.dart';
import 'package:flutter_examples_code/view/navigation_drawer/screens/account.dart';
import 'package:flutter_examples_code/view/navigation_drawer/screens/setting.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Drawer getNavDrawer(BuildContext context){
    var headChild = new DrawerHeader(child: new Text("头像"));
    var aboutChild = new AboutListTile(
      child: new Text("关于"),
      applicationName: "应用名称",
      applicationVersion: "v1.0.0",
      applicationIcon: new Icon(Icons.adb),
      icon: new Icon(Icons.info),
    );

    ListTile getNavItem(var icon, String s, String routeName){
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(s),
        onTap: (){
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }
    var myNavChildren = [
      headChild,
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      getNavItem(Icons.account_box, "Account", AccountScreen.routeName),
      aboutChild
    ];

    ListView listView = new ListView(children: myNavChildren);
    
    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Example"),
      ),
      body: new Container(
        child: new Center(
          child: new Text("主页Home"),
        ),
      ),
      drawer: getNavDrawer(context),
    );
  }
}