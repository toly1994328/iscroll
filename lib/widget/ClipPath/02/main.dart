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
              clipper: const ShapeBorderClipper(
                shape: CircleBorder(
                    side: BorderSide(color: Colors.blue, width: 2)),
              ),
              child: Image.asset(
                'assets/images/icon_head.jpg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("CircleBorder")
          ],
        ),
        Column(
          children: [
            ClipPath.shape(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/images/icon_head.jpg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("RoundedRectangleBorder")
          ],
        ),
      ],
    );
  }
}
