import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Words'),
      ),
      body: Column(
        children: [new DEMOWidget('我不是默认的'), new RandomWords()]
      ),
    );
  }
}

class RandomWords extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class DEMOWidget extends StatelessWidget{
  final String text;
  DEMOWidget(this.text);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.redAccent,
      child: Text(text ?? '我是默认text啊'),
    );
  }
}