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
        child: CustomDraggable(),
      ),
    );
  }
}

class CustomDraggable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Axis?> axis = [null, Axis.vertical, Axis.horizontal];
    return Wrap(
        spacing: 30,
        children: axis
            .map((Axis? axis) =>
            Draggable(
              axis: axis,
              childWhenDragging: buildWhenDragging(),
              child: buildContent(),
              feedback: buildFeedback(),
            ))
            .toList());
  }

  Widget buildWhenDragging() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.delete_outline,
        size: 20,
        color: Colors.white,
      ),
    );
  }

  Widget buildContent() {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildFeedback() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}


