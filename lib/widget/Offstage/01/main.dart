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
  final GlobalKey _key = GlobalKey();
  bool _offstage = true;

  Size _getSize() {
    final RenderBox box = _key.currentContext!.findRenderObject()! as RenderBox;
    return box.size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('切换显隐'),
          onPressed: () {
            setState(() {
              _offstage = !_offstage;
            });
          },
        ),
        Offstage(
          offstage: _offstage,
          child: buildChild(),
        ),
        Text('图标是否隐藏: $_offstage'),
        if (_offstage)
          ElevatedButton(
              child: const Text('获取尺寸'),
              onPressed: () {
                print('被隐藏组件尺寸: ${_getSize()}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('被隐藏组件尺寸: ${_getSize()}'),
                  ),
                );
              }
          ),
      ],
    );
  }

  Widget buildChild() =>  Padding(
    key: _key,
    padding: const EdgeInsets.all(10),
    child:CupertinoActivityIndicator(
      radius: 20,
    ),
  );
}


