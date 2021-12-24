import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
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

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // SizedBox(
      //   width: 1000,
      //   height: 2000,
      //   child: LayoutBuilder(
      //     builder: _buildByLayout,
      //   ),
      // ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 150,
          maxWidth: 200,
          maxHeight: 200,
          minHeight: 100
        ),
        child: LayoutBuilder(
          builder: _buildByLayout,
        ),
      ),
    );
  }

  Widget _buildByLayout(BuildContext context, BoxConstraints constraints) {
    print("constraints:$constraints\nisTight:${constraints.isTight}");
    return ColoredBox(
      color: Colors.blue,
    );
  }
}
