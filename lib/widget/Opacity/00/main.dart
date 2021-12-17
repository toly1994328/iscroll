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

      body: Stack(
        children: [
          Center(child: Image.asset('assets/images/bg_6.jpeg')),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OpacityTest(),
                OpacityTest2(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OpacityTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 20,
      children: [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8]
          .map((opacity) => Opacity(
                opacity: opacity,
                child: Image.asset(
                  'assets/images/icon_head.png',
                  width: 60,
                  height: 60,
                ),
              ))
          .toList(),
    );
  }
}

class OpacityTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 20,
      children: [0.1,0.2,0.3, 0.4, 0.5,0.6, 0.7, 0.8]
          .map((opacity) =>
          Image.asset(
              'assets/images/icon_head.png',
              width: 60,
              height: 60,
              color: Color.fromRGBO(255, 255, 255, opacity),
              colorBlendMode: BlendMode.modulate
          ),
      )
          .toList(),
    );
  }
}
