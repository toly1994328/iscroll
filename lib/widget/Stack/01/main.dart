
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
      body: Center(child: FlexibleDemo()),
    );
  }
}

class FlexibleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      // Container(
      // width: 200,
      // height: 150,
      // color: Colors.grey,
      // // constraints: BoxConstraints.tightFor(width:200,height:150),
      // child:
      Stack(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 60,
            height: 60,
            color: Colors.green,
          ),
          // TextField(),
          Icon(Icons.ac_unit,color: Colors.white,)
        ],
      );
  }

}


