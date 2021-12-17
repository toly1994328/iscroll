import 'package:dash_painter/dash_decoration.dart';
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
        child: BoxDecorationDemo(),
      ),
    );
  }
}

class BoxDecorationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    DecoratedBox(
      decoration: DashDecoration(
          pointWidth: 2,
          step: 5,
          pointCount: 1,
          radius: Radius.circular(15),
          gradient: SweepGradient(colors: [
            Colors.blue,
            Colors.red,
            Colors.yellow,
            Colors.green
          ])),
      child: buildContent(),
    );
  }

  Widget buildContent() {
    return SizedBox(
      width: 70,
      height: 70,
      child: Icon(
        Icons.add, color: Colors.orangeAccent, size: 40),
    );
  }
}
