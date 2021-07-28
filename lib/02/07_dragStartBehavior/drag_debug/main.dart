import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Directionality(
      textDirection: TextDirection.ltr,
      child: RawGestureDetectorDemo()));
}

class RawGestureDetectorDemo extends StatefulWidget {
  @override
  _RawGestureDetectorDemoState createState() => _RawGestureDetectorDemoState();
}

class _RawGestureDetectorDemoState extends State<RawGestureDetectorDemo> {
  String action = '';
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    Map<Type, GestureRecognizerFactory> gestures = {
      TapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
          TapGestureRecognizer>(
            () => TapGestureRecognizer(),
            (TapGestureRecognizer instance) {
          instance
            ..onTapDown = _tapDown
            ..onTapUp = _tapUp
            ..onTap = _tap
            ..onTapCancel = _tapCancel;
        },
      ),
      VerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer(),
            (VerticalDragGestureRecognizer instance) {
          instance
            ..onStart = _handleDragStart
            ..dragStartBehavior = DragStartBehavior.start;
        },
      ),

    };

    return RawGestureDetector(
      gestures: gestures,
      child: Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            "dragStartBehavior 测试",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  void _tapDown(TapDownDetails details) {
    print('_tapDown');
  }

  void _tapUp(TapUpDetails details) {
    print('_tapUp');
  }

  void _tap() {
    print('_tap');
  }

  void _tapCancel() {
    print('_tapCancel');

  }

  void _handleDragStart(DragStartDetails details) {
    print('-------${details.localPosition}-----------');
  }
}