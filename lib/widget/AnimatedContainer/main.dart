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
  final Decoration startDecoration = const BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      boxShadow: [
        BoxShadow(
            offset: Offset(1, 1),
            color: Colors.purple,
            blurRadius: 5,
            spreadRadius: 2)
      ]);

  final Decoration endDecoration = const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            offset: Offset(1, 1),
            color: Colors.blue,
            blurRadius: 10,
            spreadRadius: 0)
      ]);

  final Alignment startAlignment = Alignment.topLeft + Alignment(0.2, 0.2);
  final Alignment endAlignment = Alignment.center;

  final double startHeight = 150.0;
  final double endHeight = 100.0;

  late Decoration _decoration;
  late double _height;
  late Alignment _alignment;

  @override
  void initState() {
    super.initState();
    _decoration = startDecoration;
    _height = startHeight;
    _alignment = startAlignment;
  }

  bool get selected => _height == endHeight;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Switch(
          value: selected,
          onChanged: onChanged,
        ),
        buildAnim()
      ],
    );
  }

  // 构建动画组件
  Widget buildAnim() => AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        decoration: _decoration,
        alignment: _alignment,
        onEnd: onEnd,
        height: _height,
        width: _height,
        child: _buildChild(),
      );

  // 构建子组件
  Widget _buildChild() => const Icon(
        Icons.camera_outlined,
        size: 30,
        color: Colors.white,
      );

  // Switch 变化监听，改变状态
  void onChanged(bool value) {
    setState(() {
      _height = value ? endHeight : startHeight;
      _decoration = value ? endDecoration : startDecoration;
      _alignment = value ? endAlignment : startAlignment;
    });
  }

  void onEnd() {
    print('End');
  }
}
