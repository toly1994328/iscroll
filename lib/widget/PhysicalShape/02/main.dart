
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
      body: Center(child: PhysicalShapeDemo()),
    );
  }
}


class PhysicalShapeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: PhysicalShape(
          shadowColor: Colors.blueAccent,
          elevation: 3,
          child: Image.asset(
            'assets/images/bg_6.jpeg',
            fit: BoxFit.cover,
          ),
          clipBehavior: Clip.hardEdge,
          clipper: ShapeBorderClipper(
            shape: CircleBorder(side: BorderSide.none),
          ),
          color: Colors.deepPurpleAccent),
    );
  }
}