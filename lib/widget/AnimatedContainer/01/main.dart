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
  Alignment _alignment = Alignment.topLeft;
  Color _color = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('更新对齐方式'),
          onPressed: _change,
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
        height: 100,
        color: _color.withOpacity(0.2),
        width: 100,
        alignment: _alignment,
        onEnd: onEnd,
        child: FlutterLogo(),
      );

  void onEnd() {
    print('End');
  }

  void _change() {
    setState(() {
      _alignment =
          _alignment == Alignment.center ? Alignment.topLeft : Alignment.center;
      _color = _color == Colors.orange ? Colors.purple : Colors.orange;
    });
  }
}
