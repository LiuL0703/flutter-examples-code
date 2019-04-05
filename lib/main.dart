import 'package:flutter/material.dart';
import './view/using_theme.dart';
import './view/random_word.dart';
import './view/stateless_widgets.dart';
import './view/stateful_widget.dart';

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
        "stateless_widget":(context)=> new StatelessDemo(),
        "stateful_widget":(context)=> new StatefulDemo(),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('Using Theme Demo'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "using_theme");
              },
            ),
            FlatButton(
              child: Text('Random Words Demo'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "random_words");
              },
            ),
            FlatButton(
              child: Text('Stateless Widget'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "stateless_widget");
              },
            ),
            FlatButton(
              child: Text('Stateful Widget'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "stateful_widget");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
