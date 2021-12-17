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
      body: Center(child: PhysicalShapeDemo()),
    );
  }
}

class PhysicalShapeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 20,
      children: [
        PhysicalShape(
          shadowColor: Colors.blueAccent,
          elevation: 2,
          // child: SizedBox(
          //   width: 200,
          //   height: 120,
          // ),
          child: Image.asset(
            'assets/images/bg_6.jpeg',
            fit: BoxFit.cover,
            width: 120,
            height: 120,
          ),
          clipBehavior: Clip.antiAlias,
          clipper: TriangleClipper(),
          // clipper: HoleClipper(holeSize: 20,offset: Offset(0.05,0.1)),
          color: Colors.deepPurpleAccent,
        ),
        ClipPath(

          // child: SizedBox(
          //   width: 200,
          //   height: 120,
          // ),
          child: Image.asset(
            'assets/images/bg_6.jpeg',
            fit: BoxFit.cover,
            width: 120,
            height: 120,
          ),
          clipBehavior: Clip.antiAlias,
          clipper: TriangleClipper(),
          // clipper: HoleClipper(holeSize: 20,offset: Offset(0.05,0.1)),
        )
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

class LoveClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    double fate = 18.5*size.height/100;
    double width = size.width / 2;
    double height = size.height / 4;
    Path path = Path();

    path.moveTo(width, height);
    path.cubicTo(width, height, width + 1.1 * fate, height - 1.5 * fate, width + 2 * fate, height);
    path.cubicTo(width + 2 * fate, height, width + 3.5 * fate, height + 2 * fate, width, height + 4 * fate);

    path.moveTo(width, height);
    path.cubicTo(width, height, width - 1.1 * fate, height - 1.5 * fate, width - 2 * fate, height);
    path.cubicTo(width - 2 * fate, height, width - 3.5 * fate, height + 2 * fate, width, height + 4 * fate);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}


class HoleClipper extends CustomClipper<Path> {
  final Offset offset;
  final double holeSize;


  HoleClipper({this.offset=const Offset(0.1, 0.1), this.holeSize=20});
  @override
  Path getClip(Size size) {
    Path circlePath = Path();
    circlePath.addRRect(RRect.fromRectAndRadius(Offset.zero&size, Radius.circular(5)));

    double w = size.width;
    double h = size.height;
    Offset offsetXY = Offset( offset.dx*w,offset.dy*h);
    double d = holeSize;
    _getHold(circlePath, 1, d, offsetXY);
    circlePath.fillType = PathFillType.evenOdd;
    return circlePath;
  }

  void _getHold(Path path, int count, double d, Offset offset) {
    var left = offset.dx;
    var top = offset.dy;
    var right = left + d;
    var bottom = top + d;
    path.addOval(Rect.fromLTRB(left, top, right, bottom));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
