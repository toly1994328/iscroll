import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('ListView 基础测试'),),
      body: Center(
        child: OffstageDemo(),
      ),
    );
  }
}

class OffstageDemo extends StatefulWidget {
  @override
  _OffstageDemoState createState() => _OffstageDemoState();
}

class _OffstageDemoState extends State<OffstageDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('切换显隐'),
          onPressed: _toggleVisible,
        ),
        Visibility(
          visible: _visible,
          child: buildChild(),
          replacement: buildPlaceholder(),
          // maintainSize: true,
          // maintainAnimation: true,
          // maintainState: true,
        ),
        Text('设置 replacement 组件'),
      ],
    );
  }

  void _toggleVisible() {
    setState(() {
      _visible = !_visible;
    });
  }

  Widget buildPlaceholder() => Container(
    width: 50,
    height: 50,
    padding: const EdgeInsets.all(10),
    child: Placeholder(),
  );

  Widget buildChild() => const Padding(
    padding: const EdgeInsets.all(10),
    child: Icon(
      Icons.camera_outlined,
      color: Colors.green,
      size: 50,
    ),
  );
}
