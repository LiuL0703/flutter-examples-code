import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EasingAnimation extends StatefulWidget {
  @override
  _EasingAnimationState createState() => _EasingAnimationState();
}

class _EasingAnimationState extends State<EasingAnimation> 
  with TickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child){
        return Scaffold(
          appBar: new AppBar(
            title: new Text('Ease Animation'),
          ),
          body: Transform(
            transform: Matrix4.translationValues(_animation.value*width, 0.0, 0.0),
            child: new Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.black12,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() { 
    super.initState();
    
    _controller = 
      AnimationController(vsync: this,duration: Duration(seconds: 2));

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,))..addStatusListener(handler);
  }

  void handler(status) {
    if(status == AnimationStatus.completed) {
      _animation.removeStatusListener(handler);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.fastOutSlowIn,
        ))
        ..addStatusListener((status){
          if(status == AnimationStatus.completed){
            _controller.reverse();
          }
          if(status == AnimationStatus.dismissed){
            _controller.forward();
          }
        });
        _controller.forward();
    }
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }
}