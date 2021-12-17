import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

   double _opacity=0;

  @override
  void initState() {
    super.initState();
  }

  bool get selected => _opacity == 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          child: Slider(
            label: "$_opacity",
            value: _opacity,
            divisions: 5,
            onChanged: onChanged,
          ),
        ),
        Container(
          color: Colors.grey.withAlpha(22),
          width: 100,
          height: 100,
          child: buildAnimatedOpacity(),
        ),
      ],
    );
  }

  Widget buildAnimatedOpacity() =>
      AnimatedOpacity(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        opacity: _opacity,
        onEnd: onEnd,
        child: _buildChild(),
      );

  void onChanged(double value) {
    setState(() {
      _opacity = value;
    });
  }

  void onEnd() {
    print('End');
  }

  Widget _buildChild() =>
      const Icon(
        Icons.add_to_drive,
        color: Colors.green,
        size: 60,
      );
}
