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
    return  PhysicalShape(
      shadowColor: Colors.blueAccent,
      elevation: 3,
      // child: Image.asset(
      //   'assets/images/bg_6.jpeg',
      //   fit: BoxFit.cover,
      // ),
      child: SizedBox(
        width: 80,
        height: 80,
      ),
      clipBehavior: Clip.hardEdge,
      clipper: const ShapeBorderClipper(
        shape: CircleBorder(),
      ),
      color: Colors.deepPurpleAccent,
    );
  }
}
