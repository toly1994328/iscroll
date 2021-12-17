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
      body: Center(child: PaddingDemo()),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.topLeft,
      color: Colors.black12,
      child: Wrap(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.ac_unit,
              size: 40,
              color: Colors.green,
            ),
          ),
          // Icon(
          //   Icons.add_to_drive,
          //   size: 30,
          //   color: Colors.green,
          // )
        ],
      ),
    );
  }
}
