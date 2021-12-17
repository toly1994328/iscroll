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
      body: Center(child: StackDemo()),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.withAlpha(33),
        constraints: BoxConstraints.tightFor(width: 200, height: 150),
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: <Widget>[
            LayoutBuilder(builder: (_, c) {
              print(c);
              return Container(width: 100, color: Colors.red);
            }),
            Positioned(
                left: -20,
                top: -10,
                child: LayoutBuilder(builder: (_, c) {
                  print(c);
                  return Container(width: 60, color: Colors.green);
                })),
            Icon(
              Icons.ac_unit,
              color: Colors.white,
            )
          ],
        ));
  }
}


class A{

}