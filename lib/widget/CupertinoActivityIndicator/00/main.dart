import 'package:flutter/cupertino.dart';
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
        child: CupertinoActivityIndicatorDemo(),
      ),
    );
  }
}

class CupertinoActivityIndicatorDemo extends StatelessWidget {
  const CupertinoActivityIndicatorDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        debugDumpRenderTree();
      },
      child:
      Wrap(
        spacing: 20,
        children: [
          ScaffoldMessenger(
            child: CupertinoActivityIndicator(
              animating: true,
              radius: 15,
            ),
          ),
          CustomPaint(
            size: Size(50, 50),
            painter: BoxPainter(),
          ),
        ],
      ),
    );
  }
}

class BoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('-------BoxPainter----------');
    canvas.drawRect(Offset.zero & size, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
