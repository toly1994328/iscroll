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
      body: Center(child: CustomSizedOverflowBox()),
    );
  }
}

class CustomSizedOverflowBox extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.grey.withAlpha(88),
      width: 50,
      height: 50,
      child: buildChild(),
    );
  }

  Widget buildChild() {
    return
    SizedOverflowBox(
      alignment: Alignment.center,
      size: Size(30,25),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        width: 150,
        height: 150,
      ),
    );
  }
}
