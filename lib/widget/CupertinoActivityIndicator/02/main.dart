

import 'package:flutter/cupertino.dart';
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
        brightness: Brightness.dark,
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
        child: CupertinoActivityIndicatorDemo(),
      ),
    );
  }
}

class CupertinoActivityIndicatorDemo extends StatelessWidget {
  const CupertinoActivityIndicatorDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 20,
        children: List.generate(
          10,
              (index) => CupertinoActivityIndicator.partiallyRevealed(
            progress: 0.1 * (index+1),
            radius: 15,
          ),
        ).toList());
  }
}
