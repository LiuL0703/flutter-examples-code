import 'package:flutter/material.dart';

class AdaptedListItem extends StatelessWidget {

  const AdaptedListItem({Key key, this.name }): super(key:key);
  final String name;

  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        Container(
          width: 32.0,
          height: 32.0,
          margin: const EdgeInsets.all(8.0),
          color: Colors.lightBlueAccent.shade100,
        ),
        Text(name)
      ],
    );
  }
}


class AdaptedGridItem extends StatelessWidget {
  const AdaptedGridItem({Key key, this.name}) : super(key:key);

  final String name;

  @override
  Widget build(BuildContext context){
    return Card(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.lightBlueAccent.shade100,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(name) ,
                ),
                const IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed:null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

const double _kListItemExtant = 50.0;
const double _kMaxTileWidth = 150.0;
const double _kGridViewBreakpoint = 450.0;

class AdaptiveContainer extends StatelessWidget {
  const AdaptiveContainer({Key key, this.names}):super(key:key);
  final List<String> names;

  @override
  Widget build(BuildContext context){
    if(MediaQuery.of(context).size.width < _kGridViewBreakpoint){
      return ListView(
        itemExtent: _kListItemExtant,
        children: names.map<Widget>((String name)=> AdaptedListItem(name: name)).toList(), 
      );
    }else{
      return GridView.extent(
        maxCrossAxisExtent: _kMaxTileWidth,
        children: names.map<Widget>((String name)=> AdaptedGridItem(name: name)).toList(),
      );
    }
  }
}

List<String> _initNames(){
  final List<String> names = <String>[];
  for(int i = 0; i < 30; i++){
    names.add('Item $i');
  }
  return names;
}

final List<String> _kNames = _initNames();

class MediaQueryDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Query Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Media Query Demo'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Material(child: AdaptiveContainer(names: _kNames)),
      ),
    );
  }
}




