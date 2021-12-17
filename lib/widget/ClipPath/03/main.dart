import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
  SystemChrome.setPreferredOrientations(// 使设备横屏显示
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIOverlays([]); // 全屏显示
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
        child: ClipPathDemo(),
      ),
    );
  }
}

class ClipPathDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/icon_head.jpg',
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("原图")
          ],
        ),
        Column(
          children: [
            ClipPath(
              clipper: TriangleClipper(),
              child: Image.asset(
                'assets/images/icon_head.jpg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("TriangleClipper")
          ],
        ),        Column(
          children: [
            ClipPath(
              clipper: LoveClipper(),
              child: Image.asset(
                'assets/images/icon_head.jpg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("TriangleClipper")
          ],
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(size);
    Path path = Path()
      ..moveTo(0, size.height)
      ..relativeLineTo(size.width, 0)
      ..relativeLineTo(-size.width / 2, -size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }
}

class LoveClipper extends CustomClipper<Path>{
  //单位圆(即半径为1)控制线长
  final rate = 0.551915024494;
  List<Offset> pos = <Offset>[];

  void _initPoints(double radius) {
    pos = [];
    //第一段线
    pos.add(Offset(0,rate)*radius);
    pos.add(Offset(1 - rate, 1)*radius);
    pos.add(Offset(1+0.2, 1)*radius);
    //第二段线
    pos.add(Offset(1 + rate, 1+0.2)*radius);
    pos.add(Offset(2, rate)*radius);
    pos.add(Offset(2, 0)*radius);
    //第三段线
    pos.add(Offset(2, -rate)*radius);
    pos.add(Offset(1 + rate, -1)*radius);
    pos.add(Offset(1, -1)*radius);
    //第四段线
    pos.add(Offset(1 - rate, -1)*radius);
    pos.add(Offset(0, -rate)*radius);
    pos.add(Offset(0, 0));
  }


  @override
  Path getClip(Size size) {
    _initPoints(size.width/2);
    Path path = Path();
    path.moveTo(0, size.height/2);
    for (int i = 0; i < pos.length / 3; i++) {
      path.cubicTo(
          pos[3*i+0].dx,  pos[3*i+0].dy+size.height/2,
          pos[3*i+1].dx, pos[3*i+1].dy+size.height/2,
          pos[3*i+2].dx,  pos[3*i+2].dy+size.height/2);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
