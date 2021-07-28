import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      appBar: AppBar(title: Text('HomePage'),),
      body: ListView(
        // padding: EdgeInsets.zero,
        // itemExtent: 15, //<--- tag1
          children: List.generate(
              60,
                  (index) => ItemBox(
                index: index,
              )).toList()),
    );
  }
}

class ItemBox extends StatelessWidget {
  final int index;

  const ItemBox({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                width: 1 / window.devicePixelRatio,
              ))),
      height: 56,
      child: Text(
        '第 $index 个',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}