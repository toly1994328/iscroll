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
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration:
      BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          border: Border.all(color: Colors.red, width: 2),
          image: DecorationImage(
            image: AssetImage('assets/images/bg_6.jpeg'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            const BoxShadow(
                color: Colors.red,
                offset: Offset.zero,
                blurRadius: 2,
                spreadRadius: 2),
          ]
      ),
      child: buildContent(),
    );
  }

  Widget buildContent() {
    return SizedBox(
      width: 70,
      height: 70,
      child: Icon(Icons.android, size: 50, color: Colors.white),
    );
  }
}
