import 'package:flutter/material.dart';
import 'package:flutter_examples_code/view/animation/offsetdelay.dart';
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
import 'view/using_tab/using_tab.dart';
import 'view/using_bottom_nav_bar/using_bottom_nav_bar.dart';
import 'view/using_custom_fonts/using_custom_fonts.dart';
import 'view/using_gradient/using_gradient.dart';
import 'view/using_listview/using_listview.dart';
import 'view/using_snackbar.dart';
import 'view/grid_layout.dart';
import 'view/dropdown_button.dart';
import 'view/image_from_network.dart';
import "view/infinite_list.dart";
import 'view/persist_key_value.dart';
import 'view/tips_calculator.dart';
import 'view/whats_app.dart';
import 'view/animation_demo.dart';
import 'view/custom_render_box.dart';
import 'view/gestures.dart';
import 'view/media_query.dart';
import 'view/styled_text.dart';
import 'view/animation/easeing.dart';
import 'view/animation/valuechange.dart';
import 'view/animation/offsetdelay.dart';
import 'view/animation/masking.dart';
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
        "easing_animation": (context) => new EasingAnimation(),
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
        "whats_app": (context)=> new WhatsAppScreen(),
        "animation_demo": (context)=> new AnimationDemo(),
        "custom_render_box": (context)=> new CustomRenderBox(),
        "gestures_demo":(context)=> new GestureDemo(),
        "media_query": (context)=> new MediaQueryDemo(),
        "styled_text": (context)=> new StyleTextDemo(),
        "value_change_animation": (context)=> new ValueChangeAnimation(),
        "offset_delay_animation": (context)=> new OffsetDelayAnimation(),
        "masking_animation": (context)=> new MaskingAnimation(),
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
  final listDemoMaps = {
    "Using Theme Demo": "using_theme",
    "Random Words Demo": "random_words",
    "Stateless Widget": "stateless_widget",
    "Stateful Widget": "stateful_widget",
    "EditText Widget": "using_edittext",
    "Load Local Image": "load_local_image",
    "Load Local Json": "load_local_json",
    "Using Http Get": "using_http_get",
    "Using Alert Dialog": "using_alert_dialog",
    "Using Stepper": "using_stepper",
    "Using Tab": "using_tab",
    "Using Bottom Nav Tab": "using_bottom_nav_tab",
    "Using Custom Fonts": "using_custom_fonts",
    "Using Gradient": "using_gradient",
    "Using ListView": "using_listview",
    "Using SnackBar": "using_snackbar",
    "Grid Layout": "grid_layout",
    "Dropdown Button": "dropdown_button",
    "Image from Network":"image_from_network",
    "Infinite List": "infinite_list",
    "Persist Key Value": "persist_key_value",
    "Tips Calculator": "tips_calculator",
    "Fake Whats App": "whats_app",
    "Animation Demo": "animation_demo",
    "Custom Render Box": "custom_render_box",
    "Gestures Demo": "gestures_demo",
    "Media Query Demo": "media_query",
    "Styled Text Demo": "styled_text",
    "Easing Animation": "easing_animation",
    "Value Change Animation": "value_change_animation",
    "OffsetDelay Animation": 'offset_delay_animation',
    "Masking Animation":"masking_animation",
  };
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

  List<Widget> _initList(){
    final List<Widget> demos = <Widget>[];
    listDemoMaps.forEach((title,route)=> 
      demos.add(ListDemoItem(title: title, route: route))
    );
    return demos;
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
            children: _initList(),
          ),
        ),
      ),
      drawer: getNavDrawer(context),
    );
  }
}

class ListDemoItem extends StatelessWidget{
  const ListDemoItem({Key key, this.title, this.route}):super(key:key);
  final String title;
  final String route;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        title,
        style:TextStyle(fontSize: 20.0)
      ),
      textColor: Colors.blue,
      onPressed: (){
        Navigator.pushNamed(context, route);
      },
    );
  }
}