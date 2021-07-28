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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        controller: controller,
        children: [
          BluePage(),
          RadPage(),
          YellowPage(),
        ],
      ),
    );
  }
}

class RadPage extends StatefulWidget {
  const RadPage({Key? key}) : super(key: key);

  @override
  _RadPageState createState() => _RadPageState();
}

class _RadPageState extends State<RadPage> {
  @override
  void initState() {
    super.initState();
    print('-----RadPage-------');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class BluePage extends StatefulWidget {
  const BluePage({Key? key}) : super(key: key);

  @override
  _BluePageState createState() => _BluePageState();
}

class _BluePageState extends State<BluePage> {
  @override
  void initState() {
    super.initState();
    print('-----BluePage-------');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class YellowPage extends StatefulWidget {
  const YellowPage({Key? key}) : super(key: key);

  @override
  _YellowPageState createState() => _YellowPageState();
}

class _YellowPageState extends State<YellowPage> {
  @override
  void initState() {
    super.initState();
    print('-----Yellow-------');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
