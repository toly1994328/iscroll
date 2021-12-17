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
        child: AnimatedSwitcherDemo(),
      ),
    );
  }
}

class AnimatedSwitcherDemo extends StatefulWidget {
  @override
  _AnimatedSwitcherDemoState createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  String _currentImg = 'assets/images/icon_8.jpg';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('更新头像'),
          onPressed: _toggleVisible,
        ),
        SizedBox(height: 10,),
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: CircleAvatar(
            radius: 40,
            key: ValueKey<String>(_currentImg),
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(_currentImg),
          ),
        )
      ],
    );
  }

  void _toggleVisible() {
    setState(() {
      _currentImg = _currentImg == 'assets/images/icon_head.png'
          ? 'assets/images/icon_8.jpg'
          : 'assets/images/icon_head.png';
    });
  }
}
