import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        spacing: 40,
        children:[
          CupertinoActivityIndicator(
            animating: true,
            radius:  15,
          ),
          CupertinoActivityIndicator(
            animating: false,
            radius: 20,
          ),
        ]
    );
  }
}