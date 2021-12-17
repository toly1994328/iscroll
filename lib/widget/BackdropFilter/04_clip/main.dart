import 'dart:math';
import 'dart:ui' as ui;

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
        child: CustomBackdropFilter(),
      ),
    );
  }
}

class CustomBackdropFilter extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    String data = '';
    for (int i = 0; i < 10000; i++) {
      data += random.nextBool() ? " 0 " : " 1 ";
    }

    return Stack(
      children: <Widget>[
        Text(data),
        Center(
          child:
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: buildFilterZone(),
          ),
        ),
        // ),
      ],
    );
  }

  Widget buildFilterZone() {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: 2.0,
        sigmaY: 2.0,
      ),
      child: Container(
        alignment: Alignment.center,
        width: 200.0,
        height: 120.0,
        color: Colors.purple.withOpacity(0.1),
        child: const Text(
          'Hello World',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
