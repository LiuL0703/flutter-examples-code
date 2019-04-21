import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderDots extends RenderConstrainedBox{
  RenderDots() : super(additionalConstraints:const BoxConstraints.expand());

  @override
  bool hitTestSelf(Offset position) => true;

  final Map<int, Offset> _dots = <int, Offset>{};

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry){
    if(event is PointerDownEvent || event is PointerMoveEvent){
      _dots[event.pointer] = event.position;
      markNeedsPaint();
    } else if(event is PointerUpEvent || event is PointerCancelEvent){
      _dots.remove(event.pointer);
      markNeedsLayout();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset){
    final Canvas canvas = context.canvas;
    canvas.drawRect(offset & size, Paint()..color = const Color(0xFF0000FF));

    final Paint paint = Paint()..color = const Color(0xFF00FF00);
    for(Offset point in _dots.values){
      canvas.drawCircle(point, 50.0, paint);
    }
    super.paint(context, offset);
  }
}

class Dots extends SingleChildRenderObjectWidget{
  const Dots({Key key, Widget child}): super(key:key,child: child);

  @override
  RenderDots createRenderObject(BuildContext context) => RenderDots();
}

class CustomRenderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Custom Render Box'),
      ),
      body:SafeArea(
        child: const Directionality(
          textDirection: TextDirection.ltr,
          child: Dots(
            child: Center(
              child: Text('TOUCH ME!'),
            )
          )
        ),
      ) 
    );
  }
}