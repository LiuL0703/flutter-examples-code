import 'package:flutter/material.dart';
import 'view/using_theme.dart';
import 'view/random_word.dart';
import 'view/stateless_widgets.dart';
import 'view/stateful_widget.dart';
import 'view/using_edittext.dart';
import 'view/load_local_image.dart';
import 'view/load_local_json.dart';
import 'view/using_http_get.dart';
import 'view/using_alert_dialog.dart';
import 'view/using_stepper.dart';
import 'package:flutter_examples_code/view/using_tab/using_tab.dart';
import 'package:flutter_examples_code/view/using_bottom_nav_bar/using_bottom_nav_bar.dart';
import 'package:flutter_examples_code/view/using_custom_fonts/using_custom_fonts.dart';
import 'package:flutter_examples_code/view/using_gradient/using_gradient.dart';
import 'package:flutter_examples_code/view/using_listview/using_listview.dart';
import 'package:flutter_examples_code/view/using_snackbar.dart';
import 'package:flutter_examples_code/view/grid_layout.dart';
import 'package:flutter_examples_code/view/dropdown_button.dart';
import 'view/image_from_network.dart';
import "view/infinite_list.dart";
import 'view/persist_key_value.dart';
import 'view/tips_calculator.dart';
// import 'package:flutter_examples_code/view/navigation_drawer/screens/home.dart';
import 'package:flutter_examples_code/view/navigation_drawer/screens/account.dart';
import 'package:flutter_examples_code/view/navigation_drawer/screens/setting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 关掉debug样式
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // accentColor: Colors.lightBlueAccent,
        // 设置背景样式
        // backgroundColor: Colors.black12,
      ),
      // 添加新页面
      routes: <String, WidgetBuilder> {
        SettingsScreen.routeName: (BuildContext context) => new SettingsScreen(),
        AccountScreen.routeName: (BuildContext context) => new AccountScreen(),
        "using_theme": (context)=> new UsingTheme(),
        "random_words": (context)=> new RandomWordsWidget(),
        "stateless_widget": (context)=> new StatelessDemo(),
        "stateful_widget": (context)=> new StatefulDemo(),
        "using_edittext": (context)=> new EditText(),
        "load_local_image": (context)=> new LoadLocalImage(),
        "load_local_json": (context)=> new LoadLocalJson(),
        "using_http_get": (context)=> new GetHttpData(),
        "using_alert_dialog": (context)=> new UsingAlertDialog(),
        "using_stepper": (context)=> new UsingStepper(),
        "using_tab": (context)=> new UsingTab(),
        "using_bottom_nav_tab": (context)=> new UsingBottomNavTab(),
        "using_custom_fonts": (context)=> new UsingCustomFonts(),
        "using_gradient": (context)=> new UsingGradient(),
        "using_listview": (context)=> new UsingListView(),
        "using_snackbar": (context)=> new UsingSnackBar(),
        "grid_layout": (context)=> new GridLayout(),
        "dropdown_button": (context)=> new DropDownButton(),
        "image_from_network": (context)=> new ImageFromNetwork(),
        "infinite_list":(context)=> new RandonWordsList(),
        "persist_key_value":(context)=> new Perisist(),
        "tips_calculator":(context)=> new TipCalculator(),
        // "navigation_draw": (context)=> new HomeScreen(),
      },
      home: MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var textStyle = new TextStyle(fontSize: 20.0);

  Drawer getNavDrawer(BuildContext context){
    var headChild = new DrawerHeader(child: 
      new Center(
        child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new Card(
                child: new Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 80.0,
                ),
              ),
              new Text(
                "用户名",
                style:TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey
                )
              )
            ],
          ),
        )
    ));
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Using Theme Demo',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_theme");
                },
              ),
              FlatButton(
                child: Text('Random Words Demo',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "random_words");
                },
              ),
              FlatButton(
                child: Text('Stateless Widget',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "stateless_widget");
                },
              ),
              FlatButton(
                child: Text('Stateful Widget',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "stateful_widget");
                },
              ),
              FlatButton(
                child: Text('EditText Widget',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_edittext");
                },
              ),
              FlatButton(
                child: Text('Load Local Image',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "load_local_image");
                },
              ),
              FlatButton(
                child: Text('Load Local Json',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "load_local_json");
                },
              ),
              FlatButton(
                child: Text('Using Http Get',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_http_get");
                },
              ),
              FlatButton(
                child: Text('Using Alert Dialog',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_alert_dialog");
                },
              ),
              FlatButton(
                child: Text('Using Stepper',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_stepper");
                },
              ),
              FlatButton(
                child: Text('Using Tab',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_tab");
                },
              ),
              FlatButton(
                child: Text('Using Bottom Nav Tab',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_bottom_nav_tab");
                },
              ),
              FlatButton(
                child: Text('Using Custom Fonts',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_custom_fonts");
                },
              ),
              FlatButton(
                child: Text('Using Gradient',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_gradient");
                },
              ),
              FlatButton(
                child: Text('Using ListView',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_listview");
                },
              ),
              FlatButton(
                child: Text('Using SnackBar',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "using_snackbar");
                },
              ),
              FlatButton(
                child: Text('Grid Layout',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "grid_layout");
                },
              ),
              FlatButton(
                child: Text('Dropdown Button',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "dropdown_button");
                },
              ),
              FlatButton(
                child: Text('Image from Network',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "image_from_network");
                },
              ),
              FlatButton(
                child: Text('Infinite List',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "infinite_list");
                },
              ),
              FlatButton(
                child: Text('Persist Key Value',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "persist_key_value");
                },
              ),
              FlatButton(
                child: Text('Tips Calculator',style: textStyle),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "tips_calculator");
                },
              ),
              // FlatButton(
              //   child: Text('Navigation Draw',style: textStyle),
              //   textColor: Colors.blue,
              //   onPressed: (){
              //     Navigator.pushNamed(context, "navigation_draw");
              //   },
              // ),
            ],
          ),
        ),
      ),
      drawer: getNavDrawer(context),
    );
  }
}
