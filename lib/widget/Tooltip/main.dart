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
        child: DecorationTooltip(),
      ),
    );
  }
}

class DecorationTooltip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Tooltip(
        preferBelow: false,
        // padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
        // margin: EdgeInsets.all(10),
        verticalOffset: 15,
        message: "宝塔镇河妖",
        textStyle: TextStyle(
          color: Colors.red,
          shadows: [
            Shadow(
              color: Colors.white,
              offset: Offset(1, 1),
            ),
          ],
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent,
            offset: Offset(1, 1),
            blurRadius: 8,
          )
        ]),
        waitDuration:const Duration(seconds: 2),
        showDuration:const Duration(seconds: 2),
        child: Icon(Icons.info_outline)
      );
  }
}
