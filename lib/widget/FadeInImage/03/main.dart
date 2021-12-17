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
        child: FadeInImageDemo(),
      ),
    );
  }
}

class FadeInImageDemo extends StatelessWidget{

  final headUrl =
      'https://sf1-ttcdn-tos.pstatp.com/img/user-avatar/5b2b7b85d1c818fa71d9e2e8ba944a44~300x300.image';

  @override
  Widget build(BuildContext context) {
    return
    FadeInImage(
      width: 100,
      height: 100,
      fadeOutDuration:Duration(seconds: 1),
      fadeOutCurve: Curves.easeOutQuad,
      fadeInDuration: Duration(seconds: 2),
      fadeInCurve: Curves.easeInQuad,
      placeholder: AssetImage(
        'assets/images/default_icon.png',
      ),
      image: NetworkImage(headUrl),
    );
  }
}
