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
      body: Center(child: OverflowBoxDemo()),
    );
  }
}

class OverflowBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // color: Colors.grey.withAlpha(33),
        width: 200,
        height: 120,
        child: ColoredBox(color: Colors.blue, child: buildBox()));
  }

  Widget buildBox() {
    return OverflowBox(
      alignment: Alignment(0, -1.15),
      minHeight: 20,
      minWidth: 80,
      maxWidth: 80,
      maxHeight: 20,
      child: ColoredBox(
        color: Colors.red,
      ),
    );
  }

  buildOverflowBox() {
    return OverflowBox(
      // alignment: Alignment.centerLeft,
      minHeight: 50,
      minWidth: 200,
      maxWidth: 200,
      maxHeight: 50,
      child: SizedBox(
        width: 200,
        height: 50,
        // color: Colors.orange,
        // child: ColoredBox(color: Colors.yellow,),
      ),
      // child: Text("张风"),
    );
  }
}
