import 'package:flutter/material.dart';
import 'package:flutter_examples_code/view/navigation_drawer/screens/account.dart';
import 'package:flutter_examples_code/view/navigation_drawer/screens/home.dart';
import 'package:flutter_examples_code/view/navigation_drawer/screens/setting.dart';

// class NavigationDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Material(
//       home: new HomeScreen(),
//       routes: <String,WidgetBuilder>{
//         SettingsScreen.routeName: (BuildContext context) => new SettingsScreen(),
//         AccountScreen.routeName: (BuildContext context) => new AccountScreen(),
//       }
//     );
//   }
// }
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new HomeScreen(), 
    routes: <String, WidgetBuilder>{
      SettingsScreen.routeName: (BuildContext context) => new SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => new AccountScreen(),
    },
  ));
}
