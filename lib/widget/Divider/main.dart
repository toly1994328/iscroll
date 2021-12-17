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
      body: Center(child: DividerDemo()),
    );
  }
}

class DividerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      // DividerTheme(
      // data: DividerThemeData(
      //   color: Colors.orange,
      //   thickness: 1/window.devicePixelRatio,
      //   space: 5
      // ),
      // child:
      Container(
        width: 200,
        child: Wrap(
            children:[
              const Spacer(),
              const Divider(),
              const Divider(),
            ],
        // ),
      ),
    );
  }
}


