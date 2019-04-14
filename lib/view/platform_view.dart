import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformView extends StatefulWidget {
  const PlatformView({Key key, this.title}): super(key:key);

  final String title;
  @override
  _PlatformViewState createState() => _PlatformViewState();
}

class _PlatformViewState extends State<PlatformView> {
  static const MethodChannel _methodChannel = 
        MethodChannel('samples.flutter.io/platform_view');

  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  Future<void> _launchPlatformCount() async {
    final int platformCounter = 
        await _methodChannel.invokeMethod('switchView', _counter);
    setState(() {
      _counter = platformCounter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Button tapped $_counter time ${ _counter == 1 ? '' : 's'}',
                    style: const TextStyle(fontSize: 17.0),
                  ),
                  Padding(
                    padding:const EdgeInsets.all(18.0),
                    child: RaisedButton(
                      child: Platform.isIOS
                        ? const Text('Continue in IOS view')
                        : const Text('Continue in Android view'),
                      onPressed: _launchPlatformCount,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 15.0, left: 5.0),
            child: Row(
              children: <Widget>[
                Image.asset('assets/flutter-mark-square-64.png',scale: 1.5),
                const Text('Flutter',style: TextStyle(fontSize: 30.0))
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: const Icon(Icons.add),
      ),
    );
  }
}
