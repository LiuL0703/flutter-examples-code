import 'package:flutter/material.dart';
import './view/using_theme.dart';
import './view/random_word.dart';
import './view/stateless_widgets.dart';
import './view/stateful_widget.dart';
import './view/using_edittext.dart';
import './view/load_local_image.dart';
import './view/load_local_json.dart';
import './view/using_http_get.dart';

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
      routes: {
        "using_theme": (context)=> new UsingTheme(),
        "random_words": (context)=> new RandomWordsWidget(),
        "stateless_widget": (context)=> new StatelessDemo(),
        "stateful_widget": (context)=> new StatefulDemo(),
        "using_edittext": (context)=> new EditText(),
        "load_local_image": (context)=> new LoadLocalImage(),
        "load_local_json": (context)=> new LoadLocalJson(),
        "using_http_get": (context)=> new GetHttpData(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
          ],
        ),
      ),
    );
  }
}
