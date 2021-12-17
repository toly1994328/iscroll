import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: Center(
              child: AnimatedOpacityDemo(),
            )));
  }
}

class AnimatedOpacityDemo extends StatefulWidget {
  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  double _width = 180;
  double _height = 120;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('更新宽高'),
          onPressed: _changeSize,
        ),
        const SizedBox(
          height: 10,
        ),
        buildAnimatedContainer()
      ],
    );
  }

  Widget buildAnimatedContainer() => AnimatedContainer(
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    height: _height,
    color: Colors.black12,
    width: _width,
    onEnd: onEnd,
    // child: _buildChild(),
  );

  void onEnd() {
    print('End');
  }

  void _changeSize() {
    setState(() {
      _width = _width == 100 ? 180 : 100;
      _height = _height == 100 ? 120 : 100;
    });
  }
}
