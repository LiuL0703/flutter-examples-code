import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ValueChangeAnimation extends StatefulWidget {
  @override
  _ValueChangeAnimationState createState() => _ValueChangeAnimationState();
}

class _ValueChangeAnimationState extends State<ValueChangeAnimation> 
    with TickerProviderStateMixin {

  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: new Duration(milliseconds: 1000), vsync: this);
    final Animation curve = CurvedAnimation(
      parent: controller, curve: Curves.easeOut);
    animation = IntTween(begin: 0, end: 10).animate(curve)
      ..addStatusListener((status){
        if(status == AnimationStatus.completed){
          controller.reverse();
        }

        if(status == AnimationStatus.dismissed){
          controller.forward();
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child){
        return Scaffold(
          appBar: new AppBar(
            title: new Text('Value Change'),
          ),
          body: new Center(
            child: new Text(
              animation.value.toString(),
              style: TextStyle(fontSize: 48.0)
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }
}