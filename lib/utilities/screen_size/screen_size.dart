import 'package:flutter/material.dart';

class ScreenSize {
  final BuildContext context;
  late Size _screenSize;
  static late double width;
  static late double height;
  static late double radius;

  ScreenSize(this.context) {
    _screenSize = MediaQuery.sizeOf(context);
    width = _screenSize.width;
    height = _screenSize.height;
    radius = width * height;
  }
}
