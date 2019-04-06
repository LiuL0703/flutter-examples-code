import 'package:flutter/material.dart';

LinearGradient getCustomGradient(){
  return new LinearGradient(
    colors: [Colors.pink, Colors.blueAccent],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(0.6, 0.8),
    stops: [0.0, 0.9],
    tileMode: TileMode.clamp
  );
}