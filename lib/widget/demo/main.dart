

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
    return Container(
      color: Colors.white,
      // alignment: Alignment.center,
      child: SafeArea(
        top: true,
        child: Container(
          height: 200,
          color: Colors.grey.withAlpha(33),
          child: ListView(
            children: [
              GestureDetector(
                  onPanStart: _onPanStart,
                  onPanDown: _onPanDown,
                  onPanEnd: _onPanEnd,
                  onPanCancel: _onPanCancel,
                  onPanUpdate: _onPanUpdate,
                  child: Container(color: Colors.blue, height: 80)),
              Container(color: Colors.red, height: 80),
              Container(color: Colors.yellow, height: 80),
              Container(color: Colors.green, height: 80),
            ],
          ),
        ),
      ),
    );
  }



  void _onPanStart(DragStartDetails details) {
    print('_onPanStart');
  }

  void _onPanDown(DragDownDetails details) {
    print('_onPanDown');

  }

  void _onPanEnd(DragEndDetails details) {
    print('_onPanEnd');

  }

  void _onPanCancel() {
    print('_onPanCancel');

  }

  void _onPanUpdate(DragUpdateDetails details) {
    print('_onPanUpdate');

  }
}


//