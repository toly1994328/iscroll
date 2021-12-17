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
        child: FadeTransitionDemo(),
      ),
    );
  }
}

class FadeTransitionDemo extends StatefulWidget {
  @override
  _FadeTransitionDemoState createState() => _FadeTransitionDemoState();
}

class _FadeTransitionDemoState extends State<FadeTransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> opacityAnim;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    opacityAnim = Tween<double>(begin: 0.2, end: 1.0).animate(_ctrl);
    _ctrl..forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _ctrl.forward(from: 0);
      },
      child:
      AnimatedBuilder(
        animation: opacityAnim,
        builder: (ctx, child) => Opacity(
          opacity: opacityAnim.value,
          child: child,
        ),
        child: Image.asset(
          'assets/images/icon_head.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
